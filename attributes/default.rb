default['atom']['database_name'] = 'atom'
default['atom']['database_user'] = 'atom'
default['atom']['database_user_password'] = 'atom'

default['atom']['server_name'] = 'localhost'
default['atom']['install_dir'] = "#{node['nginx']['default_root']}/atom"

default['atom']['git_repo'] = 'git://github.com/artefactual/atom.git'
default['atom']['git_revision'] = 'stable/2.2.x'
default['atom']['install_optional_packages'] = false

default['atom']['google_analytics_api_key'] = nil
default['atom']['php_timezone'] = 'America/Toronto'

# config/factories.yml
default['atom']['config']['factories']['user_timeout'] = 1800

# Don't change anything below unless you really know what you are doing!
# Elasticsearch requires Java
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true

# AtoM requires Elasticsearch version ~> 1.3.0
default['elasticsearch']['version'] = '1.7.0'
default['elasticsearch']['allocated_memory'] = '512m'

# Nginx
default['nginx']['default_site_enabled'] = false
