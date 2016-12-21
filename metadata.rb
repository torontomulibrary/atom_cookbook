name             'atom'
maintainer       'Patrick Fung'
maintainer_email 'patrick@makestuffdostuff.com'
license          'All rights reserved'
description      'Installs/Configures atom'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.1'

depends 'chef_nginx', '~> 4.0.2'
depends 'java', '~> 1.42.0'

# AtoM lists Elasticsearch version 1.3 as a requirement.
# https://www.accesstomemory.org/en/docs/2.3/admin-manual/installation/requirements/#installation-requirements
# Don't use a more recen't version the elasticsearch cookbook. It's not
# confirmed to work with the version of Elasticsearch we are targeting (1.3.x)
# Refer to: https://github.com/elastic/cookbook-elasticsearch/tree/0.3.x
depends 'elasticsearch', '~> 0.3.14'
