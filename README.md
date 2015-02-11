# chef-buildingdb

Steps I ran to get this running, in its current state (https://github.com/polygon-city/chef-buildingdb/commit/ffc8d4108df130cd7aaa6730d7f9bf348b39169c):

- Update Ruby to 2.2.0
- Update VirtualBox
- Update Vagrant to 1.7.2
- Install the ChefDK (https://downloads.chef.io/chef-dk)

```
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
vagrant up
```
