name 'jboss'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures jboss'
long_description 'Installs/Configures jboss'
version '0.1.0'

supports 'centos'
supports 'redhat'

depends 'java'
depends 'ark'

chef_version '>= 12.4' if respond_to?(:chef_version)
