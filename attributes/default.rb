default['atom']['mysql_version'] = '5.5'
default['atom']['mysql_password'] = 'password'
default['atom']['database_name'] = 'atom'
default['atom']['database_user'] = 'atom'
default['atom']['database_user_password'] = 'atom'
default['atom']['install_dir'] = '/var/www/html/atom'

 # AtoM requires Elasticsearch version ~> 1.3.0
default['elasticsearch']['version'] = '1.3.0'

# Elasticsearch requires java
default['java']['install_flavor'] = 'openjdk' 
default['java']['jdk_version'] = '7'

# less and gulp are required to compile the .less files
default['nodejs']['npm_packages'] = [
	{ "name" => "less" },
	{ "name" => "gulp" },
]

default['php']['packages'] = %w{ php-pecl-apc php-mbstring }