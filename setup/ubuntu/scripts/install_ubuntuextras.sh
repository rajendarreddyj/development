#!/bin/bash

echo "Installing ubuntu-restricted-extras"
# Install ubuntu-restricted-extras
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install -y ubuntu-restricted-extras
echo "ubuntu-restricted-extras Installation Done"

echo "Installing ttf-mscorefonts-installer"
# Install ttf-mscorefonts-installer
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install -y ttf-mscorefonts-installer
echo "ttf-mscorefonts-installer Installation Done"