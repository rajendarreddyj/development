#!/bin/bash

# https://atom.io/

echo "atom Starting installation"

echo "Intall atom dependency"
# add-apt-repository dependency
sudo apt -y install python3-software-properties

echo "Adding atom repository"
# Add atom Repository
sudo add-apt-repository -y ppa:webupd8team/atom

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "Installing atom"
#install atom
sudo apt -y install atom

echo "atom Installation Done"