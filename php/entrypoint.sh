#!/usr/bin/env bash
set -e

while ! bash -c ">/dev/tcp/$DB_HOST/$DB_PORT"; do sleep 0.2; done

# cria o .env e app_key
if [ ! -f /var/www/html/.env ]; then
  cp /var/www/html/.env.example /var/www/html/.env
  php artisan key:generate --force
fi

# instala dependências
if [ ! -d /var/www/html/vendor ] || [ ! -f /var/www/html/vendor/autoload.php ]; then
  echo "📦 Instalando dependências Composer (runtime)..."
  composer install --no-dev --optimize-autoloader --working-dir=/var/www/html
fi

# novos pacotes e clear cache
php artisan package:discover --ansi || exit 1
php artisan config:clear

# sobe o servidor Laravel
exec php artisan serve --host=0.0.0.0 --port=8000
