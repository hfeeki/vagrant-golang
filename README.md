vagrant-golang
==============

This is a ubuntu-lucid64 vm provisioned golang, mongodb, git, bzr, mercurial, etc. 

Dependices
==========
chef  
chef-golang : https://github.com/joshholt/chef-golang.git  
apt cookbook : https://github.com/opscode-cookbooks/apt.git  
build-essential cookbook : https://github.com/opscode-cookbooks/build-essential.git  


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



