FROM php:8.3-fpm

# Instalacja zależności systemowych i PHP
RUN apt-get update && apt-get install -y \
    unzip zip curl libsqlite3-dev gnupg2 ca-certificates git  \
    && docker-php-ext-install pdo pdo_sqlite opcache

# Instalacja Node.js 20 i npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest

# Dodanie Composera z oficjalnego obrazu
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Katalog roboczy
WORKDIR /var/www/html/

# Skrypt startowy – ustawia uprawnienia
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
#USER www-data
# Ustawienie entrypoint i domyślnego polecenia
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
