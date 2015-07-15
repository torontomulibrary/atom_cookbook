default['atom']['mysql_version'] = '5.5'
default['atom']['mysql_password'] = 'password'
default['atom']['database_name'] = 'atom'
default['atom']['database_user'] = 'atom'
default['atom']['database_user_password'] = 'atom'
default['atom']['install_dir'] = '/var/www/html/atom'
default['atom']['git_repo'] = 'git://github.com/artefactual/atom.git'
default['atom']['git_revision'] = 'stable/2.2.x'

# should not change anything below this line unless you really
# know what you are doing!

# additional repositories for AtoM
default['atom']['additional_repos'] = {
  rpmforge: 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm',
  webtatic: 'https://mirror.webtatic.com/yum/el6/latest.rpm'
}

# PHP packages needed for AtoM
default['atom']['php_packages'] = %w(
  php55w
  php55w-common
  php55w-fpm
  php55w-ldap
  php55w-mbstring
  php55w-mysql
  php55w-opcache
  php55w-pecl-apcu
  php55w-xml
)

# Optional packages for AtoM
default['atom']['optional_packages'] = %w(
  ffmpeg
  gearmand
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
