# include dependencies
include 'ark'

# deploy webapp
ark 'testweb' do
  url "http://www.cumulogic.com/download/Apps/testweb.zip"
  path "/usr/share/tomcat/webapps"
  owner "tomcat"
  group "tomcat"
  action :put
  notifies :restart, 'service[tomcat]', :delayed
end
