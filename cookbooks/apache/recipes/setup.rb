# install apache
package 'httpd'

# copy maintenance page
template '/var/www/html/maintenance.html' do
  source 'maintenance.html'
end

# set virtual host for tomcat
template '/etc/httpd/conf.d/vhost_tomcat.conf' do
  source 'vhost_tomcat.conf'
  notifies :restart, 'service[httpd]', :delayed
end

# enable and start service
service 'httpd' do
  action [:enable, :start]
end
