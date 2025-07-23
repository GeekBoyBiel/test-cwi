#!/usr/bin/env bash
set -e

cd /var/www/html

# Aguarda o banco ficar disponível
echo "⏳ Aguardando conexão com o banco de dados $DB_HOST:$DB_PORT..."
while ! bash -c ">/dev/tcp/$DB_HOST/$DB_PORT" 2>/dev/null; do
  sleep 0.2
done

# Cria o .env e gera app_key
if [ ! -f .env ]; then
  echo "⚙️  Criando arquivo .env e gerando APP_KEY..."
  cp .env.example .env
  php artisan key:generate --force || true
fi

# Instala dependências se vendor não existir
echo "📦 Instalando dependências Composer (forçado)..."
composer install --no-interaction --ansi || exit 1

# Limpa caches e descobre pacotes
echo "🚀 Limpando e descobrindo pacotes..."
php artisan config:clear || true
php artisan cache:clear || true
php artisan route:clear || true
php artisan view:clear || true
php artisan package:discover --ansi || true

# Corrige permissões do Laravel
chmod -R 775 bootstrap/cache || true

mkdir -p storage/framework/{views,sessions,cache}
chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache


# Sobe o servidor Laravel (modo dev)
echo "✅ Aplicação pronta. Servidor rodando em 0.0.0.0:8000"
exec php artisan serve --host=0.0.0.0 --port=8000
