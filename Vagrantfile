#-----------------------------------------------------------------------------
#  Copyright (c) 2017, Bjorn Cole (bjorn.cole@gmail.com)
#
#  Vagrant build for OpenMBEE and required components, MMS 3.2.1
#
#  Distributed under the terms of the MIT License.
#-----------------------------------------------------------------------------

unless Vagrant.has_plugin?("vagrant-vbguest")
  system("vagrant plugin install vagrant-vbguest")
  puts "Dependencies installed, please try the 'vagrant up' command again."
  exit
end

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.3"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.memory = 4096
    vb.cpus = 2
  end
  
  config.vm.synced_folder "mms-file-area", "/vagrant"
  
  # NAT network is set up automatically, the command below adds a Host-Only Network so that services can be tested
  # from the host (e.g., Elasticsearch)
  
  config.vm.network "private_network", ip: "192.168.50.4"

  config.vm.network "forwarded_port", guest: 8080, host: 8080 # alfresco share
  config.vm.network "forwarded_port", guest: 61614, host: 61614 # websocket
  config.vm.network "forwarded_port", guest: 8081, host: 8081 # for Django
  config.vm.network "forwarded_port", guest: 9000, host: 9001 # VE
  config.vm.network "forwarded_port", guest: 9200, host: 9201, host_ip: "127.0.0.8", guest_ip: "127.0.0.4" # Elasticsearch

#  config.vm.provision :shell, path: "provision/provision_script"

# Start with a Java core

  config.vm.provision "shell", path: "provision_scripts/java_core_environment.sh"
  
# Set up Tomcat

  config.vm.provision "shell", path: "provision_scripts/tomcat_provision.sh"
  
# Configure Tomcat for Alfresco

  config.vm.provision "shell", path: "provision_scripts/tomcat_configure_alfresco.sh"
  
# Set up Postgres for graph data and Alfresco

  config.vm.provision "shell", path: "provision_scripts/postgres_provision.sh"
  
# Now add Elasticsearch

  config.vm.provision "shell", path: "provision_scripts/elastic_provision.sh"
  
# Get Git so MMS data can be pulled down

# config.vm.provision "shell", path: "provision_scripts/git_provision.sh"
  
# Use Git to download the repository info - disable since data already on machine

#  config.vm.provision "shell", path: "provision_scripts/clone_mms_repo.sh"
  
# Run Alfresco builder from Maven so that the versions are correct - disable for now to see how to set up normal Alfresco

#  config.vm.provision "shell", path: "provision_scripts/mvn_alfresco_provision.sh"

  #config.vm.provision "shell", path: "provision_scripts/provision_vieweditor.sh"
  #config.vm.provision "shell", path: "provision_scripts/services_kick.sh", run: "always"
 
# Turn on Elasticsearch and Postgres
  
  config.vm.provision "shell", path: "provision_scripts/initial_services_kick.sh", run: "always"
  
# Apply MMS schema to the postgres DB

  config.vm.provision "shell", path: "provision_scripts/postgres_configure_mms.sh"
  
# With MMS WAR's already built and deployed to an internal tomcat area, copy these over to our base Tomcat

  config.vm.provision "shell", path: "provision_scripts/alfresco_to_tomcat.sh"
  
# Adapt postgres DB to Alfresco

  config.vm.provision "shell", path: "provision_scripts/postgres_configure_alfresco.sh"

# Turn on Tomcat
  
  config.vm.provision "shell", path: "provision_scripts/tomcat_services_kick.sh", run: "always"
  
# Finally, report on what we did

  config.vm.provision "shell", path: "provision_scripts/version_echos.sh", run: "always"
  

end