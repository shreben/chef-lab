# copy maintance page to vhost document root
template '/home/apache/htdocs/maintenance.html' do
  source 'maintenance.html'
  variables({
    maintenance_file: node['apache']['maintenance_page']
  })
end
