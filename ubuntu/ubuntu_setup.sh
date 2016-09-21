#!/bin/bash
#Will restart system
#Modify these variables as needed...
# Add Required Repositories

# Update 
sudo apt update && sudo apt -y upgrade

# Install git
sudo apt install -y git

# Install Chromium Browser
sudo apt install -y chromium-browser

# Install SSH Server
sudo apt install -y ssh

# Start SSH Service
sudo systemctl restart ssh

# To automatically start your SSH server after reboot run
sudo systemctl enable ssh

# Install geany
sudo apt install -y geany

# Install gimp
sudo apt install gimp

# Install vlc player
supo apt install vlc
