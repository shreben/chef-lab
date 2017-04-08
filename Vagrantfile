# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "sbeliakou/centos-6.8-x86_64"
  config.vm.hostname = "chef-server"
  config.vm.network "private_network", ip: "192.168.168.168"
  config.vm.provider "virtualbox" do |v|  
	v.memory = 1024
	v.cpus = 1
	v.linked_clone = true
  end
  config.vm.provision 'shell', inline: <<-SHELL
	yum install -y git 2>&1 > /dev/null
	yum install -y /vagrant/chef-12.19.36-1.el6.x86_64.rpm 2>&1 > /dev/null
	yum install -y /vagrant/chefdk-1.2.22-1.el6.x86_64.rpm 2>&1 > /dev/null
	rm -rf /root/chef-lab
	git clone -b module7 https://github.com/shreben/chef-lab.git 2>&1 > /dev/null
	/bin/cp -r chef-lab/chef_cookbooks /root & /bin/cp -r chef-lab/.chef /root & rm -rf /root/chef-lab
	cp /vagrant/jboss-as-7.1.1.Final.tar.gz /root/.chef/
	chef-solo -c /root/.chef/module7_solo.rb
	SHELL
end
