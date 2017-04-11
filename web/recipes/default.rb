#
# Cookbook:: web
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#

include_recipe "web_#{node['web_server_type']}"
