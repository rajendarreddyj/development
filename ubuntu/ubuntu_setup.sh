#!/bin/bash
#Will restart system
#Modify these variables as needed...
# Add Required Repositories
# Add Java Repository
sudo add-apt-repository -y ppa:webupd8team/java

# Update 
sudo apt update && sudo apt -y upgrade

# Purge OpenJdk
sudo apt purge openjdk-*

sudo apt install virtualbox-guest-dkms virtualbox-guest-x11
# Install Java 8
sudo apt install oracle-java8-installer

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

# Install mysql
sudo apt install mysql-server
sudo apt install mysql-workbench

# Install node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt install -y nodejs

# Install yeoman
sudo npm install -g yo bower grunt-cli gulp

# Install various app generators
sudo npm install -g generator-webapp
sudo npm install -g generator-angular
sudo npm install -g generator-jhipster
sudo npm install -g generator-meanjs
sudo npm install -g cordova ionic


