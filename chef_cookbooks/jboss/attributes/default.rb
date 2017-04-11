default['jboss']['version'] = '7.1.1'
default['jboss']['url'] = 'http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz'
default['jboss']['path'] = '/opt/jboss-as'
default['jboss']['home'] = "#{default['jboss']['path']}/current"
default['jboss']['user'] = 'jboss-as'
default['jboss']['group'] = 'jboss-as'
default['jboss']['listen_address'] = '192.0.0.20'
default['application_repo'] = 'http://www.cumulogic.com/download/Apps/testweb.zip'
