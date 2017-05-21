#!/bin/bash

cd /tmp

# install Git
yes | sudo yum install git

# Get Node v4
sudo curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -

sudo yum install -y gcc-c++ make

# install Node v4
sudo yum install -y nodejs

# add Grunt
sudo npm install -g grunt-cli

# add Bower
sudo npm install -g bower

# prepare to run custom stuff
cd /vagrant/EMS-Webapp

# bring saved server config file over

sudo cp /vagrant/non_yum_installer_files/angular-mms-grunt-servers.json /vagrant/EMS-Webapp/angular-mms-grunt-servers.json

# be very careful about settings - need to force
# symbolic links off b/c npm cleans up after itself pretty aggressively

# this installs need Grunt support to EMS-Webapp directory

npm install --no-bin-links

