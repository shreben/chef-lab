#
# Cookbook:: web_apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

web 'install apache' do
  action [ :install, :setup, :start]
  provider 'web_apache'
end
