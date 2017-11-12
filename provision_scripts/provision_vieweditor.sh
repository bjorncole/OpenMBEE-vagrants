#!/bin/bash

# get node
sudo curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
sudo yum -y install nodejs

# get grunt
sudo npm install -g grunt-cli

# get bower
sudo npm install -g bower

# install git (yeah, this machine is barebones)
yes | sudo yum install git

# get to the package.json location
cd /vagrant/EMS-Webapp
sudo npm install

#run final build and start up VE server
#grunt server:ems

sudo grunt --force
grunt server:ems --force

