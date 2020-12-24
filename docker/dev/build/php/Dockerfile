FROM php:8.0-fpm-alpine

RUN adduser -D -u 1000 php

RUN mkdir /api && chown php:php /api

USER php

EXPOSE 9000

WORKDIR /api
