#!/bin/bash

# http://brackets.io/

echo "Brackets Starting installation"

echo "Intall Brackets dependency"
# add-apt-repository dependency
sudo apt install -y python3-software-properties

echo "Adding Brackets repository"
# Add Brackets Repository
sudo add-apt-repository -y ppa:webupd8team/brackets

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "Installing brackets"
# Install brackets
sudo apt install -y brackets

echo "Brackets Installation Done"