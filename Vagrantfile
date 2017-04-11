# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'sbeliakou/centos-6.8-x86_64'
  config.vm.hostname = 'stack'
  config.vm.network 'private_network', ip: '192.100.100.100'
  config.vm.provider 'virtualbox' do |v|
	v.name = 'stack'
	v.memory = 1024
	v.cpus = 1
	v.linked_clone = true
  end
  config.vm.provision 'shell', inline: <<-SHELL
	yum install -y git 2>&1 > /dev/null
	yum install -y /vagrant/chef-12.19.36-1.el6.x86_64.rpm 2>&1 > /dev/null
	yum install -y /vagrant/chefdk-1.2.22-1.el6.x86_64.rpm 2>&1 > /dev/null
	/bin/rm -rf /root/chef-lab & cd /root
	git clone -b exittask https://github.com/shreben/chef-lab.git 2>&1 > /dev/null
<<<<<<< HEAD
	chef-solo -c chef-lab/.chef/exittask_solo.rb
	echo $(curl -iL http://127.0.0.1/testweb)
	chef-solo -c chef-lab/.chef/exittask_enable_solo.rb
	echo $(curl -iL http://127.0.0.1/testweb)
	chef-solo -c chef-lab/.chef/exittask_disable_solo.rb
	echo $(curl -iL http://127.0.0.1/testweb)
=======
	chef-solo -c /root/chef-lab/.chef/module7_solo.rb > /vagrant/client_output
	chef-solo -c /root/chef-lab/.chef/module7_solo.rb > /vagrant/client_output
>>>>>>> a466df2f6bab3d39af8a81016ac08c2c177a1913
	SHELL
end
