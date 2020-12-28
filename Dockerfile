FROM php:latest

RUN apt-get update && apt-get install -y \
         libfreetype6-dev \
         libjpeg62-turbo-dev \
         libpng-dev \
         libssl-dev \
         libzip-dev \
     && apt-get autoclean && apt-get clean \
     && docker-php-ext-configure gd --with-freetype --with-jpeg \
     && docker-php-ext-install -j$(nproc) gd \
     && pecl install redis-5.0.0 \
     && docker-php-ext-enable redis \
     && docker-php-ext-install opcache \
     && docker-php-ext-install bcmath \
     && docker-php-ext-install zip \
     && docker-php-ext-install soap \
     && docker-php-ext-install swoole
