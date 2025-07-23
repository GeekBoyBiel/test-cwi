#!/bin/sh

set -e

# Gera o .env
if [ ! -f /var/www/html/.env ]; then
  echo "Arquivo .env não encontrado. Gerando a partir de .env.example..."
  cp /var/www/html/.env.example /var/www/html/.env
fi

# Gera a chave do Laravel
php artisan key:generate

# Roda as migrations
php artisan migrate --force

# Inicia o servidor Laravel
php artisan serve --host=0.0.0.0 --port=8000
