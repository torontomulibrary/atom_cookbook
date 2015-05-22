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
# Elasticsearch requires Java
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true

# AtoM requires Elasticsearch version ~> 1.3.0
default['elasticsearch']['version'] = '1.3.0'

# Nginx
default['nginx']['default_site_enabled'] = false
default['nginx']['repo_source'] = 'nginx'

default['atom']['packages'] = %w{ poppler-utils ghostscript ffmpeg git }
case node['platform_family']
when 'rhel', 'fedora'
  default['atom']['packages'] += %w{ ImageMagick ImageMagick-devel }
when 'debian', 'mac_os_x'
  default['atom']['packages'] += %w{ imagemagick }
end

# less and gulp are required to compile the .less files
default['nodejs']['npm_packages'] = [
  { "name" => "less" },
  { "name" => "gulp" },
]