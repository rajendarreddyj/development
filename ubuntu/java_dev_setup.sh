#!/bin/bash
#Will restart system
#Modify these variables as needed...
# add-apt-repository dependency
sudo apt -y install python3-software-properties
# Add Required Repositories
# Add Java Repository
sudo add-apt-repository -y ppa:webupd8team/java
# Add Brackets Repository
sudo add-apt-repository -y ppa:webupd8team/brackets
# Add Brackets Repository
sudo add-apt-repository -y ppa:webupd8team/atom
# Add nodejs Repository
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Update 
sudo apt update && sudo apt -y upgrade

# Purge OpenJdk
sudo apt purge openjdk-*

# Install Virtualbox guest additions
sudo apt -y install virtualbox-guest-dkms virtualbox-guest-x11

# Install Java 8
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt -y install oracle-java8-installer

# Install sdkman
curl -s http://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install sdk Components
sdk version
sdk install gradle
sdk install ant
sdk install maven
sdk install scala
sdk install kotlin
sdk install groovy
sdk install grails
sdk install springboot
sdk install jbossforge

# Install mysql server 
# root as password 
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt update
sudo apt -y install mysql-server
sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
mysql -u root -p root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"
sudo /etc/init.d/mysql restart

# Install mysql workbench
sudo apt -y install mysql-workbench

# Install node
sudo apt -y install nodejs
# To compile and install native addons from npm you may also need to install build tools:
sudo apt install -y build-essential
# Install yeoman
sudo npm install -g yo bower grunt-cli gulp

# Install various app generators
sudo npm install -g generator-webapp
sudo npm install -g generator-angular
sudo npm install -g generator-jhipster
sudo npm install -g generator-meanjs
sudo npm install -g cordova ionic
