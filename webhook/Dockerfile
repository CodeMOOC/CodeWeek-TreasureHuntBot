FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    gettext \
    libpng-dev \
    locales \
    zip \
    && rm -rf /var/lib/apt/lists/*

COPY ./php-prod.ini /usr/local/etc/php/php.ini

RUN docker-php-ext-install mysqli gd gettext

COPY locale.gen /etc/locale.gen
RUN locale-gen && \
        dpkg-reconfigure --frontend=noninteractive locales && \
        update-locale LANG=en_US.utf8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Copy all the stuff
COPY ./src/ /var/www/html/
COPY ./html2pdf/ /html2pdf/

# Compile translations
RUN chmod +x /var/www/html/translation/compile.sh
RUN /var/www/html/translation/compile.sh
