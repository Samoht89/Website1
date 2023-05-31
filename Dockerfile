FROM php:apache
COPY . /var/www/html/

RUN apt install perl
