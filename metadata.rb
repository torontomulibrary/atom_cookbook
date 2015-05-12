name             'atom'
maintainer       'Patrick Fung'
maintainer_email 'patrick.fung@ryerson.ca'
license          'All rights reserved'
description      'Installs/Configures atom'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'mysql', '~> 6.0'
depends 'database', '~> 4.0.6'
depends 'mysql2_chef_gem', '~> 1.0.1'
depends 'nodejs', '~> 2.4.0'