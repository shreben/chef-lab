# copy maintance page to vhost document root

template '/etc/httpd/conf.d/vhost_tomcat.conf' do
  source 'vhost_tomcat_maintenance.conf'
  variables({
    maintenance_file: node['apache']['maintenance_page']
  })
end

service 'httpd' do
  action :restart
end
