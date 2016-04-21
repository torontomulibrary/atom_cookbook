name             'atom'
maintainer       'Patrick Fung'
maintainer_email 'patrick@makestuffdostuff.com'
license          'All rights reserved'
description      'Installs/Configures atom'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'nginx', '~> 2.7.6'
depends 'java', '~> 1.39.0'
depends 'elasticsearch', '~> 0.3.13'
