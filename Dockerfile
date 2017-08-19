FROM php:7.1-apache

RUN apt-get update && apt-get install -y \
        && a2enmod rewrite \
        && docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqli \
        && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
        && echo "ServerName localhost" >> /etc/apache2/apache2.conf