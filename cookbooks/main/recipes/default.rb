
# Sync time to prevent syncing issues between VM and local env
#execute "sync-time" do
#  command "ntpdate pool.ntp.org"
#end

# update apt-get list
execute "initial-sudo-apt-get-update" do
  command "apt-get update"
end

# Our version of .bashrc has /home/vagrant/bin in PATH
#cookbook_file "/home/vagrant/.bashrc" do
#  source ".bashrc"
#  mode "0644"
#  owner "vagrant"
#  group "vagrant"
#  action :create
#end

package "mongodb"

#include_recipe "mongodb::10gen_repo"

#include_recipe "mongodb::default"


# Install git
#include_recipe "git"

# Install bazaar
#include_recipe "bazaar"
