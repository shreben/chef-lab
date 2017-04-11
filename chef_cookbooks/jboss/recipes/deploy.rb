include_recipe 'ark'
include_recipe '::install'

# deploy app to jboss
ark 'hudson' do
  url "#{node['application_repo']}"
  path "#{node['jboss']['home']}/standalone/deployments"
  owner "#{node['jboss']['user']}"
  group "#{node['jboss']['group']}"
  action :put
#  notifies :restart, 'service[jboss-as]', :delayed
end

hudson_databag = data_bag_item('module8', 'hudson')

# replcae original hudson.xml
template "#{node['jboss']['home']}/standalone/deployments/hudson/hudson.xml" do
  source 'hudson.xml'
  owner "#{node['jboss']['user']}"
  group "#{node['jboss']['group']}"
  variables({
    engine: hudson_databag['engine'],
    jboss_user: node['jboss']['user'],
    jboss_address: node['jboss']['listen_address']
  })
  notifies :restart, 'service[jboss-as]', :delayed
end
