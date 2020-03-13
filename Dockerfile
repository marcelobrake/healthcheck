FROM php:7-alpine

WORKDIR /var/www

COPY . /var/www

RUN apk add composer && cd /var/www && composer update

CMD  php -S 0.0.0.0:80 -t /var/www/public
