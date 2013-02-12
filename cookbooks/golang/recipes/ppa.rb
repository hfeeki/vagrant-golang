include_recipe "build-essential"
package "mercurial"

bash "Fetch golang source" do
  cwd "/home/vagrant"
  code <<-EOC
    hg clone -u release #{node['golang']['repo']}
  EOC
  creates "~/go"
end

bash "Build golang" do
  cwd "/home/vagrant/go/src"
  code <<-EOC
    ./all.bash
  EOC
end

bash "Export ENV Vars" do
  code <<-EOC
    echo 'export GOBIN=~/go/bin' >> /home/vagrant/.bashrc
    echo 'export PATH=$PATH:$GOBIN' >> /home/vagrant/.bashrc
    source /home/vagrant/.bashrc
  EOC
end

#include_recipe "apt"
#
## Add ppa apt repository for go
#apt_repository "gophers-go-ppa" do
#  uri          "http://ppa.launchpad.net/gophers/go/ubuntu"
#  distribution node['lsb']['codename']
#  components   ["main"]
#  key          "9AD198E9"
#  keyserver    "keyserver.ubuntu.com"
#  action :add
#end
#
#execute "apt-get update" do
#  action :nothing
#end

# Install go stable
#package "golang-stable" do
#  action :install
#end

