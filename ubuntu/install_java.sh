#!/bin/bash

# http://www.oracle.com/us/technologies/java/overview/index.html

# add-apt-repository dependency
sudo apt -y install python3-software-properties

# Add Java Repository
sudo add-apt-repository -y ppa:webupd8team/java

# Update 
sudo apt update && sudo apt -y upgrade

# Install Java 8
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt -y install oracle-java8-installer
