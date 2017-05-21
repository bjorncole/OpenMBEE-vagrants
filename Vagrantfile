#-----------------------------------------------------------------------------
#  Copyright (c) 2017, Bjorn Cole (bjorn.cole@gmail.com)
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

  config.vm.network "forwarded_port", guest: 8080, host: 8080 # alfresco share
  config.vm.network "forwarded_port", guest: 61614, host: 61614 # websocket
  config.vm.network "forwarded_port", guest: 8081, host: 8081 # for Django
  config.vm.network "forwarded_port", guest: 9000, host: 9000 # for Django
#  config.vm.network "forwarded_port", guest: 9001, host: 9001 # supervisor

#  config.vm.provision :shell, path: "provision/provision_script"

  config.vm.provision "shell", path: "provision_scripts/vagrant_provision.sh"
  config.vm.provision "shell", path: "provision_scripts/provision_vieweditor.sh"
  config.vm.provision "shell", path: "provision_scripts/services_kick.sh", run: "always"

end