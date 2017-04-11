# remove maintance page
template '/etc/httpd/conf.d/vhost_tomcat.conf' do
  source 'vhost_tomcat.conf'
end

service 'httpd' do
  action :restart
end
