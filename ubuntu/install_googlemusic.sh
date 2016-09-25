#!/bin/bash

# https://www.google.com/linuxrepositories/
# https://pl

echo "google-musicmanager-beta Starting installation"

echo "Adding google apps GPG Key"
# Download the key and then use apt to install GPG key.
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

echo "Adding google-musicmanager-beta repository"
# Add Google Music Manager Repository
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/musicmanager/deb/ stable main" >> /etc/apt/sources.list.d/google-musicmanager.list'

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

# Install google-musicmanager-beta
sudo apt install -y google-musicmanager-beta

echo "google-musicmanager-beta Installation Done"