vagrant-cheatsheet
===================

A cheatsheet on the usage of vagrant.

# List running machines
VBoxManage list runningvms
 
# Start VM
vagrant up
 
# Shutting down and remove the VM (all changes will be lost)
vagrant destroy
 
# SSH into a running VM
vagrant ssh
 
# Stop VM
vagrant halt
 
# Create an initial Vagrantfile with a specific base box
vagrant init hashicorp/precise64
 
# Specify base box
config.vm.box = "hashicorp/precise64"
 
# Specify a shell script as the provision platform (multiple platforms are possible)
config.vm.provision :shell, path: "bootstrap.sh"
 
# Specifiy port forwarding from VM to host system
config.vm.network :forwarded_port, guest: 80, host: 4567
 
# Start VM with provision
vagrant up --provision
 
# Apply provision on running vm
vagrant provision

 vagrant suspend #memory off
vagrant resume #memory on
 
 # setup vagrant
gem install vagrant
vagrant box add lucid32 http://files.vagrantup.com/lucid32.box
mkdir my_vagrant_test
cd my_vagrant_test
vagrant init lucid32
vim Vagrantfile
vagrant up
vagrant ssh
 
# inside virtual machine
whoami
cd /vagrant
ruby -v
sudo apt-get update
sudo apt-get install build-essential zlib1g-dev curl git-core sqlite3 libsqlite3-dev
 
# vagrant commands
vagrant reload
vagrant status
vagrant suspend
vagrant resume
vagrant halt
vagrant up
vagrant package
vagrant destroy
 
