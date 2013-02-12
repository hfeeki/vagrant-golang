vagrant-golang
==============

This is a ubuntu-10.04.4-server lucid64 vm provisioned golang, mongodb, git, bzr, mercurial. 

Dependices
==========
chef  
chef-golang : https://github.com/joshholt/chef-golang.git  
apt cookbook : https://github.com/opscode-cookbooks/apt.git  
build-essential cookbook : https://github.com/opscode-cookbooks/build-essential.git  


Usage
==================
The vm is based on lucid64 templates in veewee directory.

```
cd veewee
vagrant basebox build lucid64 
vagrant basebox export lucid64
cd -
vagrant up 
vagrant provision

```


Provision
==========
recipe golang::local will download code to "/home/vagrant/go" and compile, install it.  
recipe main will install mongodb  
```
config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "cookbooks"
     chef.add_recipe "main"
     chef.add_recipe "golang::local"
end
```




