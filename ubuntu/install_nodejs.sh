#!/bin/bash

# https://nodejs.org/en/

# Add nodejs Repository
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

# Install node
sudo apt -y install nodejs

# To compile and install native addons from npm you may also need to install build tools:
sudo apt install -y build-essential

# Install yeoman
sudo npm install -g yo bower grunt-cli gulp

# Install various app generators
sudo npm install -g generator-webapp
sudo npm install -g generator-angular
sudo npm install -g generator-jhipster
sudo npm install -g generator-meanjs
sudo npm install -g cordova ionic
