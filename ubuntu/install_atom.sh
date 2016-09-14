#!/bin/bash
# add-apt-repository dependency
sudo apt -y install python3-software-properties

# Add Brackets Repository
sudo add-apt-repository -y ppa:webupd8team/atom

# Update 
sudo apt update && sudo apt -y upgrade

#install atom
sudo apt -y install atom
