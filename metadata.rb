name             'atom'
maintainer       'Patrick Fung'
maintainer_email 'patrick@makestuffdostuff.com'
license          'All rights reserved'
description      'Installs/Configures atom'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

# Used to provide necessary repos
depends 'yum-epel', '~> 0.6.5'

# Used to install MySQL and configure mysqld instance
depends 'mysql', '~> 6.1.2'

# Used to run MySQL queries via chef
depends 'database', '~> 4.0.9'
depends 'mysql2_chef_gem', '~> 1.0.2'

# Elasticsearch requires Java
depends 'java', '~> 1.39.0'
depends 'elasticsearch', '~> 0.3.13'

# Nginx
depends 'nginx', '~> 2.7.6'

# Node.js
depends 'nodejs', '~> 2.4.4'
