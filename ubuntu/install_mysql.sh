#!/bin/bash

# Variables
DBPASSWD=toor

echo "MySQL Starting installation"

echo "Updating packages"
sudo apt update && sudo apt -y upgrade

echo "Installing base packages"
sudo apt -y install vim curl build-essential > /dev/null 2>&1

# MySQL 
echo "Preparing MySQL"
sudo apt -y install debconf-utils > /dev/null
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"

echo "Installing MySQL"
sudo apt -y install mysql-server > /dev/null

sudo mv /etc/mysql/my.cnf /etc/mysql/my.cnf_backup
sudo sed 's/bind-address/#bind-address/g' /etc/mysql/my.cnf_backup | sed 's/skip-external-locking/#skip-external-locking/g' > /etc/mysql/my.cnf
sudo service mysql restart

echo "MySQL Installation Done"
