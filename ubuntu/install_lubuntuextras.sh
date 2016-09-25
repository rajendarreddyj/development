#!/bin/bash

echo "Installing lubuntu-restricted-extras"
# Install lubuntu-restricted-extras
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install -y lubuntu-restricted-extras
echo "lubuntu-restricted-extras Installation Done"

echo "Installing ttf-mscorefonts-installer"
# Install ttf-mscorefonts-installer
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install -y ttf-mscorefonts-installer
echo "ttf-mscorefonts-installer Installation Done"

echo "Installing pavucontrol"
# http://askubuntu.com/questions/774458/installed-lubuntu-16-04-version-no-audio-now
sudo apt install -y pavucontrol
echo "pavucontrol Installation Done"

