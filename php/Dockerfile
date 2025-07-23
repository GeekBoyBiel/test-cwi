FROM php:8.2-fpm

# Instala dependências do sistema e extensões do PHP
RUN apt-get update \
 && apt-get install -y libpq-dev zip unzip git curl dos2unix \
 && docker-php-ext-install pdo pdo_pgsql

# Instala Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Define diretório
WORKDIR /var/www/html

# Copia o projeto antes de rodar o composer
COPY . .

# Instala dependências do PHP
RUN composer install --prefer-dist --classmap-authoritative

# Copia entrypoint (libera permissao, erro do windowns acho)
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN dos2unix /usr/local/bin/entrypoint.sh \
 && chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["php-fpm"]
