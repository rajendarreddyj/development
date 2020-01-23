#!/bin/bash

# https://nodejs.org/en/

echo "nodejs Starting installation"

echo "Installing nodejs dependencies"
# To compile and install native addons from npm you may also need to install build tools:
sudo apt install -y build-essential curl

echo "Adding nodejs repository"
# Add nodejs Repository
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -


echo "Installing nodejs"
# Install node
sudo apt install -y nodejs

echo "nodejs Installation Done"

echo "Installing npm packages yo/bower/grunt/gulp/angular/http-server/typescript/cordova/express"
# Install yeoman
sudo npm install -g yo bower grunt-cli gulp http-server typescript cordova express
echo "yo/bower/grunt/gulp/angular/http-server/typescript/cordova/express Installation done"

echo "Installing npm generators"
# Install various app generators
sudo npm install -g generator-webapp
sudo npm install -g generator-angular
sudo npm install -g generator-jhipster
sudo npm install -g generator-meanjs
sudo npm install -g cordova ionic
echo "npm generators Installation done"
