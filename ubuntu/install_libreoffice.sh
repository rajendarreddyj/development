#!/bin/bash

# https://www.libreoffice.org/

echo "libreoffice Starting installation"

echo "Intall libreoffice dependency"
# add-apt-repository dependency
sudo apt install -y python3-software-properties

echo "Adding libreoffice repository"
# Add libreoffice Repository
sudo add-apt-repository ppa:libreoffice/ppa

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "Installing libreoffice"
#install libreoffice
sudo apt install -y libreoffice

echo "libreoffice Installation Done"