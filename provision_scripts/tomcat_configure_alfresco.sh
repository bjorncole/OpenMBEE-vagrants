# Configure Tomcat install to work with Alfresco


# Move to Tomcat directory
cd $CATALINA_HOME

# Build Alfresco-required directories

sudo mkdir shared
sudo mkdir shared/classes
sudo mkdir shared/lib

# Move pre-made configuration files into the right directories

sudo cp -f /vagrant/non_yum_installer_files/config_files/catalina.properties $CATALINA_HOME/conf/catalina.properties
sudo cp -f /vagrant/non_yum_installer_files/config_files/server.xml $CATALINA_HOME/conf/server.xml
sudo cp -f /vagrant/non_yum_installer_files/config_files/tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml