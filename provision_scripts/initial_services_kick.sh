#!/bin/bash

# start Tomcat
#sudo bash $CATALINA_HOME/bin/startup.sh

# start ElasticSearch
sudo service elasticsearch start

#Start Postgres
sudo systemctl start postgresql

# Start ActiveMQ
#cd /usr/local/activemq/bin
#sudo ./activemq start