FROM php:8.2-fpm

# Instala dependências de sistema
RUN apt-get update \
 && apt-get install -y libpq-dev zip unzip git curl dos2unix \
 && docker-php-ext-install pdo pdo_pgsql

# Instala Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Define o diretório da aplicação
WORKDIR /var/www/html

# Copia todos os arquivos da aplicação
COPY . .

# Copia e prepara o entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN dos2unix /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh

# Define o entrypoint e comando padrão
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

