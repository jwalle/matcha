FROM php:7.0-apache

RUN apt-get update && apt-get install -y \
        git zip unzip \
        && a2enmod rewrite \
        && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80