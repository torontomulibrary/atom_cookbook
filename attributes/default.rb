default['atom']['mysql_version'] = '5.5'
default['atom']['mysql_password'] = 'password'
default['atom']['database_name'] = 'atom'
default['atom']['database_user'] = 'atom'
default['atom']['database_user_password'] = 'atom'
default['atom']['install_dir'] = '/var/www/html/atom'
default['atom']['git_repo'] = 'git://github.com/artefactual/atom.git'
default['atom']['git_revision'] = 'stable/2.2.x'
default['atom']['install_optional_packages'] = false

# should not change anything below this line unless you really
# know what you are doing!

default['yum-epel']['repositories'] = %w{epel}
  
# additional repositories for AtoM
default['atom']['additional_repos'] = {
  rpmforge: 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm'
}

# PHP packages needed for AtoM
default['atom']['php_packages'] = %w(
  php
  php-common
  php-fpm
  php-ldap
  php-mbstring
  php-mysql
  php-opcache
  php-pecl-apcu
  php-pecl-gearman
  php-xml
)

# Optional packages for AtoM
default['atom']['optional_packages'] = %w(
  fop
  ffmpeg
  ghostscript
  ImageMagick
  ImageMagick-devel
  memcached
  poppler-utils
)

# Elasticsearch requires Java
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true

# AtoM requires Elasticsearch version ~> 1.3.0
default['elasticsearch']['version'] = '1.3.0'

# Nginx
default['nginx']['default_site_enabled'] = false
