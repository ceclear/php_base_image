FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
         libfreetype6-dev \
         libjpeg62-turbo-dev \
         libpng-dev \
         libssl-dev \
         libzip-dev \
     && apt-get autoclean && apt-get clean \
     && docker-php-ext-configure gd --with-freetype --with-jpeg \
     && docker-php-ext-install -j$(nproc) gd \
     && pecl install redis-5.3.2 \
     && docker-php-ext-enable redis \
     && docker-php-ext-install zip \
     && apt-get clean \
     && apt-get autoclean \
     && cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

MAINTAINER 594652523@qq.com
