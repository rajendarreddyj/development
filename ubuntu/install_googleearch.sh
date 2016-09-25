#!/bin/bash

# https://www.google.com/linuxrepositories/
# https://www.google.com/earth/

echo "google earth Starting installation"

echo "Adding google apps GPG Key"
# Download the key and then use apt to install GPG key.
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

echo "Adding google-earth repository"
# Add Google Earch Repository
sudo sh -c 'echao "deb [arch=amd64] http://dl.google.com/linux/earth/deb/ stable main" >> /etc/apt/sources.list.d/google-earth.list'

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

# Install google-earth-stable
sudo apt install -y google-earth-stable

echo "google earth Installation Done"