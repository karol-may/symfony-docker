#!/bin/bash

# Nadanie odpowiednich uprawnień
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Ustaw prawa zapisu do pliku SQLite, jeśli istnieje
if [ -f /var/www/html/database/database.sqlite ]; then
    chmod ug+rw /var/www/html/database/database.sqlite
fi

# Uruchomienie PHP-FPM
exec php-fpm
