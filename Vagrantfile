# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # define box to use
  config.vm.box = 'sbeliakou/centos-6.8-x86_64'

  # define chef-server vm
  config.vm.define 'chefsrv' do |chefsrv|
  chefsrv.vm.hostname = 'chef-server'
  chefsrv.vm.network 'private_network', ip: '192.0.0.10'
  chefsrv.vm.provider 'virtualbox' do |v|
    v.name = 'chef-server'
    v.memory = 4096
    v.cpus = 2
    v.linked_clone = true
  end
  chefsrv.vm.provision 'shell', inline: <<-SHELL
	  yum install -y git 2>&1 > /dev/null
	  yum install -y /vagrant/chef-server-core-12.14.0-1.el6.x86_64.rpm 2>&1 > /dev/null
	  chef-server-ctl reconfigure
    if [ -d /root/.chef ]; then
      chef-server-ctl user-create admin Charlie Root root@chef.io '!QAZ1qaz' --filename /root/.chef/admin_private_key.pem
    else
      mkdir /root/.chef & chef-server-ctl user-create admin Charlie Root root@chef.io '!QAZ1qaz' --filename /root/.chef/admin_private_key.pem
    fi
    chef-server-ctl org-create lab 'DevOps Lab 2017' --association_user admin --filename /root/.chef/lab-validator.pem
    chef-server-ctl install chef-manage --path /vagrant/chef-manage-2.5.1-1.el6.x86_64.rpm
    chef-server-ctl reconfigure
    chef-manage-ctl reconfigure --accept-license
    grep jboss /etc/hosts
    if [ $? -ne 0 ]; then
      echo "192.0.0.20 jboss" >> /etc/hosts
      echo "192.0.0.30 mysql" >> /etc/hosts
    fi
	  SHELL
  end

  # define jboss vm
  config.vm.define 'jboss' do |jboss|
    jboss.vm.hostname = 'jboss'
    jboss.vm.network 'private_network', ip: '192.0.0.20'
    jboss.vm.provider 'virtualbox' do |v|
      v.name = 'jboss'
      v.memory = 1024
      v.cpus = 1
      v.linked_clone = true
    end
    jboss.vm.provision 'shell', inline: <<-SHELL
    grep chef-server /etc/hosts
    if [ $? -ne 0 ]; then
      echo "192.0.0.10 chef-server" >> /etc/hosts
      echo "192.0.0.30 mysql" >> /etc/hosts
    fi
    SHELL
  end

  # define mysql vm
  config.vm.define 'mysql' do |mysql|
    mysql.vm.hostname = 'mysql'
    mysql.vm.network 'private_network', ip: '192.0.0.30'
    mysql.vm.provider 'virtualbox' do |v|
      v.name = 'mysql'
      v.memory = 1024
      v.cpus = 1
      v.linked_clone = true
    end
  end
end
