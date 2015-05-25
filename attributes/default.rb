default['atom']['mysql_version'] = '5.5'
default['atom']['mysql_password'] = 'password'
default['atom']['database_name'] = 'atom'
default['atom']['database_user'] = 'atom'
default['atom']['database_user_password'] = 'atom'
default['atom']['install_dir'] = '/var/www/html/atom'
default['atom']['git_repo'] = 'git://github.com/artefactual/atom.git'
default['atom']['git_revision'] = 'stable/2.1.x'


# should not change anything below this line unless you really
# know what you are doing!

# ImageMagick package name is different on debian/ubuntu
default['atom']['install_packages'] = %w{
  git
  ImageMagick
  ImageMagick-devel
  ghostscript
  poppler-utils
  ffmpeg
}

default['atom']['php_packages'] =  %w{ php56w php56w-opcache php56w-common php56w-mysql php56w-xml php56w-ldap php56w-pecl-apcu php56w-mbstring php56w-fpm }

# Elasticsearch requires Java
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true
# default['elasticsearch']['user'] = 'nginx'

# AtoM requires Elasticsearch version ~> 1.3.0
default['elasticsearch']['version'] = '1.3.0'

# Nginx
default['nginx']['default_site_enabled'] = false
# default['nginx']['repo_source'] = 'nginx'

# less and gulp are required to compile the .less files
default['nodejs']['npm_packages'] = [
  { "name" => "less" },
  { "name" => "gulp" }
]