# OpenMBEE-vagrants
Virtual machine bootstrapping for OpenMBEE. This is intended to provide a relatively painless first install on a local system to start to see the functionality of the OpenMBEE and also understand its configuration.

## General considerations

There are shell scripts to provision the virtual machine. They are intended to take a very bare CentOS image and install all dependencies and start required services.

## Instructions

Install VirtualBox and Vagrant.

Clone repositories as needed as sub-directories to the "mms-file-area." Download Java 8 JDK to the "non_yum_installer_files" area because Oracle doesn't allow web-based downloads from scripts.

Be sure to add configuration files from MMS and Webapp repositories (for example, creating an "mms.properties" file beside "mms.properties.example").

**Be careful in the current configuration - PostgresSQL will be configured to "trust" to make initial connection easier. Apply proper authentication if this is to be exposed to something outside your local desktop.**