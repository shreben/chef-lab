#
# Cookbook:: web_nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

web 'install nginx' do
  action [ :install, :setup, :start]
  provider 'web_nginx'
end

