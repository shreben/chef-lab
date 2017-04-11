# setup java
include_recipe 'java'

# setup tomcat
package 'tomcat'

# enable and start tomcat
service 'tomcat' do
  action [:enable, :start]
end
