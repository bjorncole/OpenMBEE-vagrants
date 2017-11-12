# Install Tomcat from its server and then cleanup

sudo wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz

# Extract to recommended location

export CATALINA_HOME=/usr/share/apache-tomcat-7.0.82

sudo mkdir $CATALINA_HOME

sudo tar -zxvf apache-tomcat-7.0.82.tar.gz -C /usr/share/

# Set up environment variables

echo "export CATALINA_HOME=$CATALINA_HOME" >> /etc/bashrc

# Clean up

yes | sudo rm apache-tomcat-7.0.82.tar.gz

