# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

dir = File.dirname(File.expand_path(__FILE__))
configValues = YAML.load_file("#{dir}/config.yaml")
data         = configValues['vm']
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "https://github.com/ilflask/vagrant_image_debian8/raw/master/debian_8.7.box" 
  config.vm.network "private_network", ip: "#{data['network']}"
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.provision "shell", path: "restart.sh", run: "always"
  config.vm.provider "virtualbox" do |vm|
    vm.memory = 1024
    vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/home/vagrant/project", "1"]
  end
  config.vm.synced_folder "#{data['synced_folder']}", "/home/vagrant/project"
end

