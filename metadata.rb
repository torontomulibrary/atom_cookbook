name             'atom'
maintainer       'Patrick Fung'
maintainer_email 'patrick@makestuffdostuff.com'
license          'All rights reserved'
description      'Installs/Configures atom'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.2'

depends 'chef_nginx', '~> 4.0.2'
depends 'java', '~> 1.50.0'

depends 'elasticsearch', '~> 2.5.0'
