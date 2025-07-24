FROM php:8.2-fpm

# Instala dependências do sistema
RUN apt-get update \
 && apt-get install -y libpq-dev zip unzip git curl dos2unix netcat-openbsd \
 && docker-php-ext-install pdo pdo_pgsql

# Instala Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Define o diretório de trabalho
WORKDIR /var/www/html

# Copia os arquivos da aplicação
COPY . .

# Copia e configura o script de inicialização
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN dos2unix /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh

# Define o entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
