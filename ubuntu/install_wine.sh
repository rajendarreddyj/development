#!/bin/bash

# https://www.winehq.org/

echo "Brackets Starting installation"

echo "Intall wine dependency"
# add-apt-repository dependency
sudo apt -y install python3-software-properties

echo "Intall wine dependency"
# Add Wine Repository
sudo add-apt-repository -y ppa:ubuntu-wine/ppa

echo "Updating packages"
# Update 
sudo apt update && sudo apt -y upgrade

echo "Installing wine"
#install atom
sudo apt install -y wine1.8

echo "wine Installation Done"