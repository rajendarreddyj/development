#!/bin/bash

# Download the key and then use apt to install GPG key.
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# https://www.google.com/chrome/
# https://www.google.com/linuxrepositories/

# Add Google Chrome Repository
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

# Install google-chrome-stable
sudo apt install -y google-chrome-stable

# https://www.google.com/earth/

# Add Google Earch Repository
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/earth/deb/ stable main" >> /etc/apt/sources.list.d/google-earth.list'

# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

# Install google-earth-stable
sudo apt install -y google-earth-stable

# Add Google Music Manager Repository
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/musicmanager/deb/ stable main" >> /etc/apt/sources.list.d/google-musicmanager.list'

# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

# Install google-musicmanager-beta
sudo apt install -y google-musicmanager-beta