#
# Cookbook Name:: atom
# Recipe:: install_php
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package node['atom']['php_packages']

template '/etc/php.ini' do
  source 'php.ini.erb'
end

template '/etc/php-fpm.d/atom.conf' do
  source 'atom.php-fpm.erb'
end

service 'php-fpm' do
  service_name 'php-fpm'
  supports start: true, stop: true, restart: true, reload: true
  action [:enable, :start]
end
