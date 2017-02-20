#!/bin/bash

# http://www.oracle.com/us/technologies/java/overview/index.html

echo "Java 8 Starting installation"

echo "Intall java repository dependency"
# add-apt-repository dependency
sudo apt -y install python3-software-properties

echo "Adding java repository"
# Add Java Repository
sudo add-apt-repository -y ppa:webupd8team/java

echo "Updating packages"
# Update 
sudo apt update && sudo apt -y upgrade

echo "Installing java 8"
# Install Java 8
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt install -y oracle-java8-installer

echo "java Installation Done"