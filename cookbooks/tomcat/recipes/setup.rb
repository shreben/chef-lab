# setup java
include 'java'

# setup tomcat
package 'tomcat'

# enable and start tomcat
service 'tomcat' do
  action [:enable, :start]
end
