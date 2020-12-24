FROM php:8.0-fpm-alpine

RUN apk update && apk upgrade

RUN apk add autoconf g++ make

RUN docker-php-ext-install mysqli pdo_mysql

RUN pecl install xdebug

RUN echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.discover_client_host=1" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN adduser -D -u 1000 php

RUN mkdir /api && chown php:php /api

USER php

WORKDIR /api
