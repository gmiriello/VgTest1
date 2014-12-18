#!/usr/bin/env bash

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
DEBIAN_FRONTEND=noninteractive apt-get -q -y install nginx php5 php5-cli php5-cgi spawn-fcgi php5-mysql php5-mcrypt php5-curl php5-gd php5-fpm openssl php-apc php5-mcrypt mcrypt redis-server mysql-server-5.5 mysql-client-5.5
ln -s /etc/php5/mods-available/mcrypt.ini /etc/php5/fpm/conf.d/20-mcrypt.ini 
	service php5-fpm restart 
service nginx start