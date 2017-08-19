FROM php:7.0-apache

RUN apt-get update && apt-get install -y \
        git zip unzip wget vim\
        ca-certificates \
        supervisor \
        && a2enmod rewrite \
        && docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqli \
        && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
        && echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

# Add phpmyadmin
ENV PHPMYADMIN_VERSION=4.6.4
RUN wget -O /tmp/phpmyadmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.tar.gz
RUN tar xfvz /tmp/phpmyadmin.tar.gz -C /var/www
RUN ln -s /var/www/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages /var/www/phpmyadmin
RUN mv /var/www/phpmyadmin/config.sample.inc.php /var/www/phpmyadmin/config.inc.php

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80