include_recipe 'java'
include_recipe 'ark'

# add jboss group
group "#{node['jboss']['group']}" do
  action :create
end

# add jboss user
user "#{node['jboss']['user']}" do
  gid "#{node['jboss']['group']}"
  home "#{node['jboss']['path']}"
  manage_home true
  system true
  action :create
end

# create jboss config directory
directory '/etc/jboss-as' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# download jboss, untar, create symlink to JBOSS_HOME
ark 'jboss-as' do
  url "#{node['jboss']['url']}"
  version "#{node['jboss']['version']}"
  prefix_root "#{node['jboss']['path']}"
  path "#{node['jboss']['path']}"
  home_dir "#{node['jboss']['home']}"
  owner "#{node['jboss']['user']}"
  group "#{node['jboss']['group']}"
end

# copy jboss init script config
template '/etc/jboss-as/jboss-as.conf' do
  source 'jboss-as.conf'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
    jboss_home: node['jboss']['home'],
    jboss_user: node['jboss']['user'],
    jboss_address: node['jboss']['listen_address']
  })
end

# create jboss init script
template '/etc/init.d/jboss-as' do
  source 'jboss-as-standalone.sh'
  mode '0755'
  owner 'root'
  group 'root'
end

# enable and start jboss service
service 'jboss-as' do
  supports :start => true, :stop => true, :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
  subscribes :restart, 'template[/etc/jboss-as/jboss-as.conf]', :delayed
end
