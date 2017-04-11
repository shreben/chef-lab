# custom provider for apache web server

use_inline_resources

action :install do
  package 'nginx' do
    action :install
  end
  service 'nginx' do
    action [:enable, :start]
  end
end

action :setup do
  template '/usr/share/nginx/html/index.html' do
  source 'index.html'
  end
end

action :start do
  service 'nginx' do
    action :start
  end
end

action :stop do
  service 'nginx' do
    action :stop
  end
end

action :restart do
  service 'nginx' do
    action :restart
  end
end

action :reload do
  service 'nginx' do
    action :reload
  end
end
