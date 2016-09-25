#!/bin/bash

echo "Updating packages"
# Update 
sudo apt update && sudo apt -y upgrade


echo "Installing chromium"
# Install Chromium Browser (http://www.chromium.org/)
sudo apt install -y chromium-browser
echo "chromium Installation Done"