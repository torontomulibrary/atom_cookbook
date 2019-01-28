default['atom']['git_repo'] = 'git://github.com/artefactual/atom.git'
default['atom']['git_revision'] = 'stable/2.3.x'

default['atom']['plugins'] = []

default['atom']['google_analytics_api_key'] = nil

# config/factories.yml
default['atom']['config']['factories']['user_timeout'] = 1800

# Don't change anything below unless you really know what you are doing!
default['atom']['install_dir'] = "#{node['nginx']['default_root']}/atom"
default['atom']['log_dir'] = "#{node['nginx']['log_dir']}/atom/"

# AtoM asks for Oracle Java 8 or newer
# Oracle has been known to change the behavior of its download site frequently. 
# It is recommended you store the archives on an artifact server or s3 bucket. 
# You can then override the attributes in a cookbook, role, or environment:
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true
default['java']['jdk']['8']['x86_64']['url'] = 'https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz'
default['java']['jdk']['8']['x86_64']['checksum'] = 'cb700cc0ac3ddc728a567c350881ce7e25118eaf7ca97ca9705d4580c506e370'

# AtoM lists Elasticsearch version 1.3 as a requirement.
# Do not use 2.0 or higher as they have deprecated a number of APIs used in AtoM
# https://www.accesstomemory.org/en/docs/2.3/admin-manual/installation/requirements/#installation-requirements
default['elasticsearch']['version'] = '1.7.6'
