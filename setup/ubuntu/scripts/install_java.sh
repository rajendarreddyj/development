#!/bin/bash

# http://www.oracle.com/us/technologies/java/overview/index.html

echo "Java 8 Starting installation"

echo "Intall java repository dependency"
# add-apt-repository dependency
sudo apt -y install python3-software-properties

echo "Updating packages"
# Update 
sudo apt update && sudo apt -y upgrade

echo "Installing java 11"
# Install Java 11
sudo apt install -y openjdk-11-jre-headless

echo "java Installation Done"
