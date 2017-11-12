# Get Alfresco binary file from the file stash

sudo cp /vagrant/non_yum_installer_files/config_files/install_opts /vagrant/install_opts

sudo cp /vagrant/non_yum_installer_files/alfresco-community-installer-201606-EA-linux-x64.bin /vagrant/alfresco-community-installer-201606-EA-linux-x64.bin

cd /vagrant

sudo ./alfresco-community-installer-201606-EA-linux-x64.bin --optionfile install_opts

sudo rm alfresco-community-installer-201606-EA-linux-x64.bin

sudo rm install_opts