default['atom']['git_repo'] = 'git://github.com/artefactual/atom.git'
default['atom']['git_revision'] = 'stable/2.3.x'

default['atom']['google_analytics_api_key'] = nil

# config/factories.yml
default['atom']['config']['factories']['user_timeout'] = 1800

# Don't change anything below unless you really know what you are doing!
default['atom']['install_dir'] = "#{node['nginx']['default_root']}/atom"
default['atom']['log_dir'] = "#{node['nginx']['log_dir']}/atom/"

# AtoM asks for Oracle Java 8 or newer
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true

# AtoM lists Elasticsearch version 1.3 as a requirement.
# Do not use 2.0 or higher as they have deprecated a number of APIs used in AtoM
# https://www.accesstomemory.org/en/docs/2.3/admin-manual/installation/requirements/#installation-requirements
default['elasticsearch']['version'] = '1.3.0'
