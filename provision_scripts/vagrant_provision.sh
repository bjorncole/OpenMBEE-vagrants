#!/bin/bash

# update system
sudo yum -y update
sudo yum -y upgrade
echo "system updated ..."

# install java and maven
# use local file because Oracle hates the Internet
# the "yes" pipe feeds an okay to the prompts
sudo yes | yum localinstall /vagrant/non_yum_installer_files/jdk-8u131-linux-x64.rpm

# Now get Maven
wget http://www-us.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz
sudo tar xzf apache-maven-3.5.0-bin.tar.gz -C /usr/local
# Clean up after wget
sudo rm apache-maven-3.5.0-bin.tar.gz
# now do a link to untar'ed directory
cd /usr/local
sudo ln -s apache-maven-3.5.0 maven

# set environment variables for this session

export JAVA_HOME=/usr/java/jdk1.8.0_131
export MVN_HOME=/usr/local/maven
export PATH=$PATH:$JAVA_HOME:$MVN_HOME/bin

# set them in the profile

echo "export JAVA_HOME=/usr/java/jdk1.8.0_131" >> /etc/bashrc
echo "export MVN_HOME=/usr/local/maven" >> /etc/bashrc
echo "export PATH=$PATH" >> /etc/bashrc

# Install ElasticSearch from its server and then cleanup

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.3.2.rpm
sudo rpm --install elasticsearch-5.3.2.rpm
rm elasticsearch-5.3.2.rpm

# start ElasticSearch
sudo service elasticsearch start

# run script to fix up elastic search for MMS

sudo /vagrant/mms/mms-ent/repo-amp/src/main/java/gov/nasa/jpl/view_repo/db/mms_mappings.sh

# Install Postgres - this seems to get 9.2, might not be compatible
vagran
sudo yes | yum install postgresql-server postgresql-contrib
sudo postgresql-setup initdb

# cheat the permissions by starting in trust mode
sudo cp /vagrant/non_yum_installer_files/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf

#Start Postgres
sudo systemctl start postgresql

# Invoke the various SQL commands to set up PGSQL for use by MMS

sudo psql -U postgres -c "CREATE USER vagrant;"
sudo psql -U postgres -c "CREATE USER mms WITH PASSWORD 'mmspass';"
# so we can run mms.sql
sudo psql -U postgres -c "CREATE USER root;"
# make db
sudo psql -U postgres -c "CREATE DATABASE mms;"
# grant needed permissions to the MMS user

sudo psql -c "GRANT ALL ON DATABASE mms TO mms;" -U postgres
sudo psql -c "ALTER USER mms CREATEDB;" -U postgres
sudo psql -c "ALTER DATABASE mms OWNER TO mms;" -U postgres

# sudo can connect to root role after the user has been made
sudo psql -d mms -a -f /vagrant/mms/mms-ent/repo-amp/src/main/java/gov/nasa/jpl/view_repo/db/mms.sql

# mms.sql makes tables - these lines hand them over to mms

sudo psql -c "ALTER TABLE organizations OWNER TO mms;" -U postgres -d mms
sudo psql -c "ALTER TABLE projectmounts OWNER TO mms;" -U postgres -d mms
sudo psql -c "ALTER TABLE projects OWNER TO mms;" -U postgres -d mms

sudo psql -c "GRANT ALL ON TABLE organizations TO mms;" -U postgres -d mms
sudo psql -c "GRANT ALL ON TABLE projectmounts TO mms;" -U postgres -d mms
sudo psql -c "GRANT ALL ON TABLE projects TO mms;" -U postgres -d mms

# Add ActiveMQ
cd /usr/local
sudo cp /vagrant/non_yum_installer_files/apache-activemq-5.14.5-bin.tar.gz apache-activemq-5.14.5-bin.tar.gz
sudo tar xzf apache-activemq-5.14.5-bin.tar.gz
sudo ln -s apache-activemq-5.14.5 activemq

# Start service
cd /usr/local/activemq/bin
sudo ./activemq start

# Fire the Maven bulider as downloaded from OpenMBEE GitHub
# First trial took a bit over 30 minutes
cd /vagrant/mms/mms-ent
mvn clean install

# note that the run script seems to do a lot better when run in su mode

#sudo /vagrant/mms/mms-ent/run.sh