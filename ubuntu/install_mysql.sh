#!/bin/bash

# http://www.mysql.com/

# Variables
DBPASSWD=toor

echo "MySQL Starting installation"

echo "Updating packages"
sudo apt update && sudo apt -y upgrade

echo "Installing base packages"
sudo apt -y install vim curl build-essential

# MySQL 
echo "Preparing MySQL"
sudo apt -y install debconf-utils
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"

echo "Installing MySQL Server"
sudo apt -y install mysql-server

echo "Installing MySQL Workbench"
sudo apt -y install mysql-server-workbench

sudo mv /etc/mysql/my.cnf /etc/mysql/my.cnf_backup
sudo sed 's/bind-address/#bind-address/g' /etc/mysql/my.cnf_backup | sed 's/skip-external-locking/#skip-external-locking/g' > /etc/mysql/my.cnf
sudo service mysql restart

echo "Installing MySQL"
sudo apt -y install mysql-server

echo "MySQL Installation Done"

