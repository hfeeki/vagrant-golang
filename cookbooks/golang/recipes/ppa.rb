include_recipe "build-essential"
package "mercurial"

include_recipe "apt"

# Add ppa apt repository for go
apt_repository "gophers-go-ppa" do
  uri          "http://ppa.launchpad.net/gophers/go/ubuntu"
  distribution node['lsb']['codename']
  components   ["main"]
  key          "9AD198E9"
  keyserver    "keyserver.ubuntu.com"
  action :add
end

execute "apt-get update" do
  action :nothing
end

# Install go stable
package "golang-stable" do
  action :install
end

bash "Export ENV Vars" do
  code <<-EOC
    echo 'export GOBIN=/usr/local/go/bin' >> /home/vagrant/.bashrc
    echo 'export PATH=$PATH:$GOBIN' >> /home/vagrant/.bashrc
    source /home/vagrant/.bashrc
  EOC
end

