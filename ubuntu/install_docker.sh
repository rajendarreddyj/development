#!/bin/bash

# https://docs.docker.com/engine/installation/linux/ubuntulinux/

echo "docker-engine Starting installation"

echo "Adding docker-engine GPG Key"
# Add the GPG key for the official Docker repository to the system
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "Adding docker-engine Repository"
# Add the Docker repository to APT sources
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" >> /etc/apt/sources.list.d/docker.list'

echo "Updating packages"
# Update your package manager & Upgrade.
sudo apt update && sudo apt -y upgrade

echo "Installing recommended packages"
# Install the recommended packages.
sudo apt install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

echo "Installing docker-engine package"
# Install docker-enginer.
sudo apt install -y docker-engine

echo "Checking docker Status"
# Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it's running:
sudo systemctl status docker

echo "Adding username to docker group"
# add your username to the docker group
sudo usermod -aG docker $(whoami)

echo "docker-engine Installation Done"