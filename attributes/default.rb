default['atom']['mysql_version'] = '5.5'
default['atom']['mysql_password'] = 'password'

default['atom']['database_name'] = 'atom'
default['atom']['database_user'] = 'atom'
default['atom']['database_user_password'] = 'atom'

default['atom']['server_name'] = 'localhost'
default['atom']['install_dir'] = '/var/www/html/atom'

default['atom']['git_repo'] = 'git://github.com/artefactual/atom.git'
default['atom']['git_revision'] = 'stable/2.2.x'
default['atom']['install_optional_packages'] = false

default['atom']['google_analytics_api_key'] = nil
default['atom']['php_timezone'] = 'America/Toronto'

# config/factories.yml
default['atom']['config']['factories']['user_timeout'] = 1800

# Don't change anything below unless you really know what you are doing!
default['yum-epel']['repositories'] = %w( epel )

# additional repositories for AtoM
if platform_family?('rhel')
  case node['platform_version'].to_i
  when 7
    # FIXME: ffmpeg seems like it's not included in rpmforge for el7 releases?
    rpmforge_rpm = 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm'
  when 6
    rpmforge_rpm = 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
  end
  default['atom']['additional_repos'] = {
    rpmforge: rpmforge_rpm
  }
end

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
# Reference webtatic PHP packages for EL6 releases
if platform_family?('rhel') && node['platform_version'].to_i == 6
  default['atom']['php_packages'] = %w(
    php55w
    php55w-common
    php55w-fpm
    php55w-ldap
    php55w-mbstring
    php55w-mysql
    php55w-opcache
    php55w-pecl-apcu
    php55w-pecl-gearman
    php55w-xml
  )
end

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
default['elasticsearch']['version'] = '1.7.0'
default['elasticsearch']['allocated_memory'] = '512m'

# Nginx
default['nginx']['default_site_enabled'] = false
