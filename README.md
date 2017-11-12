# OpenMBEE-vagrants
Virtual machine bootstrapping for OpenMBEE. This is intended to provide a relatively painless first install on a local system to start to see the functionality of the OpenMBEE and also understand its configuration.

The build-up for a version of MMS working on a non-embedded Tomcat and database is progressing through a series of shell scripts. I've pulled back the View Editor builder until it can be updated.

## General considerations

There are shell scripts to provision the virtual machine. They are intended to take a very bare CentOS image and install all dependencies and start required services.

## Instructions

Install VirtualBox and Vagrant.

Clone repositories as needed as sub-directories to the "mms-file-area." Download Java 8 JDK to the "non_yum_installer_files" area because Oracle doesn't allow web-based downloads from scripts. Ditto ActiveMQ. Also get an appropriate JDBC connector for Tomcat: https://jdbc.postgresql.org/download.html

The Vagrantfile has scripts commented out for downloading Git, cloning the MMS repo, and launching Maven to build the MMS. You only have to do this once! But after an hour or so of cranking, you will have a running Alfresco instance with all the source code built in a shared folder. You can then re-comment those scripts and have a much faster rebuild in subsequent tries / resets of your environment.

Be sure to add configuration files from MMS and Webapp repositories (for example, creating an "mms.properties" file beside "mms.properties.example").

Wait until the MMS is up and running - in a browser navigate to the orgs REST service (in this case, localhost:8080/alfresco/service/orgs to test for activity).