#!/bin/bash

# https://www.google.com/chrome/
# https://www.google.com/linuxrepositories/

echo "google apps Starting installation"

echo "Adding google apps GPG Key"
# Download the key and then use apt to install GPG key.
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

echo "Adding google-chrome repository"
# Add Google Chrome Repository
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "google-chrome Starting installation"
# Install google-chrome-stable
sudo apt install -y google-chrome-stable
echo "google-chrome Installation Done"

# https://www.google.com/earth/

echo "Adding google-earth repository"
# Add Google Earch Repository
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/earth/deb/ stable main" >> /etc/apt/sources.list.d/google-earth.list'

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "google-earth Starting installation"
# Install google-earth-stable
sudo apt install -y google-earth-stable
echo "google-earth Installation Done"

echo "Adding google-music repository"
# Add Google Music Manager Repository
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/musicmanager/deb/ stable main" >> /etc/apt/sources.list.d/google-musicmanager.list'

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "google-musicmanager-beta Starting installation"
# Install google-musicmanager-beta
sudo apt install -y google-musicmanager-beta
echo "google-musicmanager-beta Installation Done"

echo "google apps Installation Done"