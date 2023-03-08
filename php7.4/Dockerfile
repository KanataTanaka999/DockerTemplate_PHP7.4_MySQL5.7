FROM php:7.4-apache
COPY php.ini /usr/local/etc/php/
RUN apt-get update;
RUN apt-get install -y \
  libpq-dev \
  libfreetype6-dev \
  libicu-dev \
  libjpeg62-turbo-dev \
  libzip-dev \
  unzip \
  zlib1g-dev \
  libwebp-dev \
  ;

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp
RUN docker-php-ext-install zip gd mysqli pdo_mysql opcache intl
RUN pecl install apcu && echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apc.ini
RUN  a2enmod rewrite
