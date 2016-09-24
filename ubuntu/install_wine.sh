#!/bin/bash

# https://www.winehq.org/

# add-apt-repository dependency
sudo apt -y install python3-software-properties

# Add Wine Repository
sudo add-apt-repository -y ppa:ubuntu-wine/ppa

# Update 
sudo apt update && sudo apt -y upgrade

#install atom
sudo apt install -y wine1.8