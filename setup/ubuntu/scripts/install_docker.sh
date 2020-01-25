#!/bin/bash

# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

echo "Docker Engine - Community Starting installation"

echo "Installing recommended packages"
sudo apt-get install  -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    linux-image-extra-virtual 
    
echo "Adding docker-engine GPG Key"
# Add the GPG key for the official Docker repository to the system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Verify Fingerpring"
sudo apt-key fingerprint 0EBFCD88

echo "Adding docker-engine Repository"
# Add the Docker repository to APT sources
#sudo add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
sudo sh -c 'echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list'   
   
echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "Installing docker-ce package"
# Install docker-ce.
sudo apt install -y install docker-ce docker-ce-cli containerd.io

echo "Checking docker Status"
# Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it's running:
sudo systemctl status docker

echo "Adding username to docker group"
# add your username to the docker group
sudo usermod -aG docker $(whoami)

# Verify that Docker CE is installed correctly by running the hello-world image.
sudo docker run hello-world

#To create the docker group and add your user:
#Create the docker group.
sudo groupadd docker
#Add your user to the docker group.
sudo usermod -aG docker $USER
#Log out and log back in so that your group membership is re-evaluated.
#If testing on a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.
#On a desktop Linux environment such as X Windows, log out of your session completely and then log back in.
#On Linux, you can also run the following command to activate the changes to groups:
newgrp docker 

echo "Docker Engine - Community Installation Done"
