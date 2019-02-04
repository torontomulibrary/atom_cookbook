name             'atom'
maintainer       'Patrick Fung'
maintainer_email 'patrick@makestuffdostuff.com'
license          'All rights reserved'
description      'Installs/Configures atom'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.6.1'

depends 'chef_nginx', '~> 6.2.0'
depends 'java', '~> 3.1.2'

# AtoM lists Elasticsearch version 1.7.x as a requirement.
# The elasticsearch community cookbook is written to support ES v2.x+
# By sheer luck v2.5.0 still works to install the version of ES we want
# but it probably won't work in the future
# https://supermarket.chef.io/cookbooks/elasticsearch/versions/2.5.0
depends 'elasticsearch', '~> 2.5.0'
