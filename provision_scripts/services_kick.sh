#!/bin/bash

# Just light up the services and set up environment variables
export JAVA_HOME=/usr/java/jdk1.8.0_131
export MVN_HOME=/usr/local/maven
export PATH=$PATH:$JAVA_HOME:$MVN_HOME/bin

# start ElasticSearch
sudo service elasticsearch start

#Start Postgres
sudo systemctl start postgresql

# Start ActiveMQ
cd /usr/local/activemq/bin
sudo ./activemq start