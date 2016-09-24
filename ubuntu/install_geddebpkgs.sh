#!/bin/bash

# http://www.getdeb.net/welcome/

# Download the key and then use apt to install GPG key.
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -

# Add getdeb Repository
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'

# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

# Install filezilla
# https://filezilla-project.org/
sudo apt install -y filezilla

# Install gnome-connection-manager
# http://kuthulu.com/gcm/
sudo apt install -y gnome-connection-manager

# Install Perl Auto Connector(pac)
# https://sites.google.com/site/davidtv/
sudo apt install -y pac