#!/bin/bash

# http://www.skype.com/

echo "skype Starting installation"

echo "Intall skype dependency"
# add-apt-repository dependency
sudo apt install -y python3-software-properties

echo "Adding skype(canoncial) repository"
# Add skype(canoncial) Repository
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

# Add i386 architecture
sudo dpkg --add-architecture i386

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "Installing skype"
#install skype
sudo apt install -y skype

echo "skype Installation Done"