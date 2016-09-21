#!/bin/bash
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
# Update your package manager.
sudo apt update
# Add the GPG key for the official Docker repository to the system
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# Add the Docker repository to APT sources
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
# Update your package manager.
sudo apt update
# Install the recommended packages.
sudo apt install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
# Install docker-enginer
sudo apt install -y docker-engine
# Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it's running:
sudo systemctl status docker
# add your username to the docker group
sudo usermod -aG docker $(whoami)