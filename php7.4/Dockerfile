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
# mailhogにメールを送信するため、mhsendmailをインストール
RUN curl -sSL https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 -o mhsendmail \
    && chmod +x mhsendmail \
    && mv mhsendmail /usr/local/bin/mhsendmail

# SSL
COPY ./ssl/ssl.crt /etc/ssl/certs/
COPY ./ssl/ssl.key /etc/ssl/private/
RUN sed -i 's!/etc/ssl/certs/ssl-cert-snakeoil.pem!/etc/ssl/certs/ssl.crt!g' /etc/apache2/sites-available/default-ssl.conf \
    && sed -i 's!/etc/ssl/private/ssl-cert-snakeoil.key!/etc/ssl/private/ssl.key!g' /etc/apache2/sites-available/default-ssl.conf
RUN a2enmod ssl \
    && a2ensite default-ssl.conf
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp \
  && wp --info

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp
RUN docker-php-ext-install zip gd mysqli pdo_mysql opcache intl
RUN pecl install apcu && echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apc.ini
RUN  a2enmod rewrite
