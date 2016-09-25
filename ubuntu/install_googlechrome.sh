#!/bin/bash

# https://www.google.com/linuxrepositories/
# https://www.google.com/chrome/

echo "google chrome Starting installation"

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

echo "google chrome Installation Done"