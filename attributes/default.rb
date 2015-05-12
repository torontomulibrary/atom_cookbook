default['atom']['mysql_version'] = '5.5'
default['atom']['mysql_password'] = 'password'
default['atom']['database_name'] = 'atom'
default['atom']['database_user'] = 'atom'
default['atom']['database_user_password'] = 'atom'
default['atom']['install_dir'] = '/var/www/html/atom'

default['elasticsearch']['version'] = '1.5.2' # AtoM requires Elasticsearch version > 1.3.0

default['java']['install_flavor'] = 'openjdk' # Elasticsearch requires java
default['java']['jdk_version'] = '7'

default['nodejs']['npm_packages'] = [
	{ "name" => "less" },
	{ "name" => "gulp" },
]