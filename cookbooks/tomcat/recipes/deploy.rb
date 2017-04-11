# include dependencies

remote_file '/tmp/testweb.zip' do
  source 'http://www.cumulogic.com/download/Apps/testweb.zip'
end

bash 'extract_app' do
  code <<-EOH
    unzip -j "/tmp/testweb.zip" -d "/usr/share/tomcat/webapps"
    EOH
  not_if { ::File.exist?("/usr/share/tomcat/webapps/testweb.war") }
end
