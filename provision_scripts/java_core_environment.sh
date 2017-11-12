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
wget https://archive.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz
sudo tar xzf apache-maven-3.5.0-bin.tar.gz -C /usr/local
# Clean up after wget
sudo rm apache-maven-3.5.0-bin.tar.gz
# now do a link to untar'ed directory
cd /usr/local
sudo ln -s apache-maven-3.5.0 maven

# set environment variables for this session

export JAVA_HOME=/usr/java/jdk1.8.0_131
export JRE_HOME=/usr/java/jdk1.8.0_131
export MVN_HOME=/usr/local/maven
export PATH=$PATH:$JAVA_HOME:$MVN_HOME/bin

# set them in the profile

echo "export JAVA_HOME=/usr/java/jdk1.8.0_131" >> /etc/bashrc
echo "export MVN_HOME=/usr/local/maven" >> /etc/bashrc
echo "export PATH=$PATH" >> /etc/bashrc
echo "export JRE_HOME=$JAVA_HOME" >> /etc/bashrc