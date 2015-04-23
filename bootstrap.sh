#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install git -y

sudo apt-get install apache2 -y
sudo apt-get install php5 -y

sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server-5.6

sudo apt-get install php5-mysql -y

sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2ensite default-ssl

sudo ln -s /vagrant/www /www
sudo perl -pi -e "s@DocumentRoot /var/www/html@DocumentRoot /vagrant/www@" /etc/apache2/sites-enabled/000-default.conf
sudo perl -pi -e "s@DocumentRoot /var/www/html@DocumentRoot /vagrant/www@" /etc/apache2/sites-enabled/default-ssl.conf
sudo perl -pi -e "s@www-data@vagrant@" /etc/apache2/envvars
sudo perl -pi -e "s@/var/www@/vagrant/www@" /etc/apache2/apache2.conf

sudo service apache2 restart

