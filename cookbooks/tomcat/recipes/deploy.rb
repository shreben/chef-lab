# include dependencies
include_recipe 'ark'

# deploy webapp
#ark "testweb" do
#  url "http://www.cumulogic.com/download/Apps/testweb.zip"
#  path "/usr/share/tomcat/webapps"
#  owner "tomcat"
#  group "tomcat"
#  creates "testweb.war"
#  action :put
#  strip_components 1
#  notifies :restart, "service[tomcat]", :delayed
#end

remote_file '/tmp/testweb.zip' do
  source 'http://www.cumulogic.com/download/Apps/testweb.zip'
end

bash 'extract_app' do
  code <<-EOH
    unzip -j "/tmp/testweb.zip" -d "/usr/share/tomcat/webapps"
    EOH
  not_if { ::File.exist?("/usr/share/tomcat/webapps/testweb.war") }
end
