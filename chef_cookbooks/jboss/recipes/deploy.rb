include_recipe 'ark'
include_recipe '::install'

# deploy app to jboss
ark 'testweb' do
  url 'http://www.cumulogic.com/download/Apps/testweb.zip'
  path "#{node['jboss']['home']}/standalone/deployments"
  owner "#{node['jboss']['user']}"
  group "#{node['jboss']['group']}"
  action :put
  notifies :restart, 'service[jboss-as]', :delayed
end
