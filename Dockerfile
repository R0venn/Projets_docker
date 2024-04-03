FROM php:8.1-apache-bookworm

# Mise à jour des paquets et installation de paquets de base
RUN apt-get -y update && apt-get upgrade -y
RUN apt-get -y install wget unzip

# Installation des dépendances pour PHP
RUN apt-get install -y libpng-dev libxml2-dev libzip-dev libldap2-dev 
RUN docker-php-ext-install gd mysqli soap zip ldap

# Configuration de PHP
RUN echo "session.save_path = '/tmp'" >> /usr/local/etc/php/php.ini

# Installation de iTop
RUN wget https://sourceforge.net/projects/itop/files/latest/download -O /tmp/itop.zip
RUN unzip /tmp/itop.zip "web/*" -d /var/www/html/itop
RUN mv /var/www/html/itop/web/*  /var/www/html/itop
RUN chmod -R 777 /var/www/html/itop

# Exposition du port 80
EXPOSE 80