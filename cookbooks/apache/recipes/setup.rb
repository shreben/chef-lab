# install apache
package 'httpd'

# ensure vhost document root exists
directory '/home/apache/htdocs' do
  owner 'apache'
  group 'apache'
  mode '0755'
  action :create
end

# set virtual host for tomcat
template '/etc/httpd/conf.d/vhost_tomcat.conf' do
  source 'vhost_tomcat.conf'
  notify :restart, 'service[httpd]', :delayed
end

# enable and start service
service 'httpd' do
  action [:enable, :start]
end
