FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
    gettext \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install gettext

COPY ./ /var/www/html/
