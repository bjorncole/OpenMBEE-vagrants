# Use Git to pull down the MMS into a folder under the shared one

cd /vagrant

sudo git clone https://github.com/Open-MBEE/mms.git

# replace the repository POM with a tailored one

#sudo cp -rf /vagrant/non_yum_installer_files/config_files/pom_alf.xml /vagrant/mms/mms-ent/pom.xml

# copy over mms properties

sudo cp -rf /vagrant/non_yum_installer_files/config_files/mms.properties /vagrant/mms/mms-ent/mms.properties