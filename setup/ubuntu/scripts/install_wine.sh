#!/bin/bash

# https://wiki.winehq.org/Ubuntu

echo "Wine HQ Starting installation"

echo "enable 32 bit architectur"
sudo dpkg --add-architecture i386 

echo "Add Wine Repository"
# Add Wine Repository
sudo apt-add-repository -y "deb https://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"

echo "Updating packages"
# Update 
sudo apt update && sudo apt -y upgrade

echo "Installing Wine HQ"
#install atom
sudo apt install --install-recommends winehq-stable

echo "Wine HQ Installation Done"
