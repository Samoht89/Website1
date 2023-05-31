FROM php:apache
COPY . /var/www/html/

RUN apt get install perl
