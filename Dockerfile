FROM perl:5.34
COPY . /var/www/html/

RUN apt update && apt install -y libapache2-mod-perl2 libapache2-mod-perl2-dev libcgi-pm-perl liblocal-lib-perl
RUN a2enmod cgid
