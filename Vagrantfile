# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'buildingdb'
  config.omnibus.chef_version = '11.12.8'
  config.berkshelf.enabled = true
  config.vm.box = 'ubuntu-14.04-opscode'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box'
  config.vm.network :private_network, ip: '192.168.10.10'

  config.vm.provision :chef_solo do |chef|
    chef.json = {
    }

    chef.run_list = [
      'recipe[buildingdb::default]'
    ]
  end
end
