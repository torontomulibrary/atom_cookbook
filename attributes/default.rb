default['atom']['mysql_version'] = '5.5'
default['atom']['mysql_password'] = 'password'
default['atom']['database_name'] = 'atom'
default['atom']['database_user'] = 'atom'
default['atom']['database_user_password'] = 'atom'
default['atom']['install_dir'] = '/var/www/html/atom'

default['elasticsearch']['version'] = '1.5.2' # AtoM requires Elasticsearch version > 1.3.0

default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['nodejs']['npm_packages'] = [
	{ "name" => "less" },
	{ "name" => "gulp" },
]