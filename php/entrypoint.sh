#!/usr/bin/env bash
set -e

cd /var/www/html

echo "⏳ Aguardando conexão com o banco de dados $DB_HOST:$DB_PORT..."
while ! nc -z "$DB_HOST" "$DB_PORT"; do
  sleep 0.2
done
echo "✅ Banco disponível!"

# Garante que o .env existe
if [ ! -f .env ]; then
  echo "⚙️  Criando arquivo .env..."
  cp .env.example .env
fi

# Instala dependências
if [ ! -d vendor ]; then
  echo "📦 Instalando dependências do Composer..."
  composer install --no-interaction --prefer-dist --ansi
else
  echo "📦 Dependências já instaladas."
fi

# Gera APP_KEY se necessário
if grep -q "^APP_KEY=$" .env || ! grep -q "^APP_KEY=" .env; then
  echo "🔐 Gerando APP_KEY..."
  php artisan key:generate --ansi --force
fi

# Cria diretórios e permissões
mkdir -p bootstrap/cache storage/framework/{views,sessions,cache}
chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache

# Limpa caches
echo "🚀 Limpando e descobrindo pacotes..."
php artisan config:clear || true
php artisan cache:clear || true
php artisan route:clear || true
php artisan view:clear || true
php artisan package:discover --ansi || true

# Verifica chave
if grep -q "^APP_KEY=$" .env; then
  echo "❌ APP_KEY ainda está vazia! Abortando..."
  exit 1
fi

# Executa migrations e seed
echo "🧩 Executando migrations e seed..."
php artisan migrate:fresh --seed || {
  echo "❌ Falha nas migrations/seed."
  exit 1
}

# Gera documentação Swagger
echo "📚 Gerando documentação Swagger..."
php artisan l5-swagger:generate || {
  echo "❌ Falha ao gerar Swagger."
  exit 1
}

# Sobe o servidor Laravel
echo "✅ Aplicação pronta. Servidor rodando em 0.0.0.0:8000"
exec php artisan serve --host=0.0.0.0 --port=8000
