# OpenMBEE-vagrants
Virtual machine bootstrapping for OpenMBEE. This is intended to provide a relatively painless first install on a local system to start to see the functionality of the OpenMBEE and also understand its configuration.

There are now two stages (I will break more up soon) - provisioning MMS and its dependencies and then View Editor and its dependencies.

## General considerations

There are shell scripts to provision the virtual machine. They are intended to take a very bare CentOS image and install all dependencies and start required services.

## Instructions

Install VirtualBox and Vagrant.

Clone repositories as needed as sub-directories to the "mms-file-area." Download Java 8 JDK to the "non_yum_installer_files" area because Oracle doesn't allow web-based downloads from scripts. Ditto ActiveMQ.

Be sure to add configuration files from MMS and Webapp repositories (for example, creating an "mms.properties" file beside "mms.properties.example").

Once the machine has been provisioned, log in and navigate to /vagrant/mms/mms-ent. Run the "run.sh" script as root user. You may also need to manually re-enter the "export" commands to get the Maven path environment variables into a useful state.

Wait until the MMS is up and running - in a browser navigate to the orgs REST service (in this case, localhost:8080/alfresco/service/orgs to test for activity).

Load the test org and test project from the README on the mms repository.

Then, create a angular-mms-grunt-servers.json file as in the EMS-Webapp repo instructions with only the entry "localhost": "localhost." This will make the VE connect to your running MMS service.

Open another SSH session to your running VM. In this window, follow the final instruction (running grunt) of the EMS-Webapp repo but with the command "grunt server:localhost."

Once the script finishes, you should be able to log into a VE at the following web address: http://localhost.com:9000/mms.html#/login

**Be careful in the current configuration - PostgresSQL will be configured to "trust" to make initial connection easier. Apply proper authentication if this is to be exposed to something outside your local desktop.**