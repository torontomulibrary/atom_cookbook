#
# Cookbook Name:: atom
# Recipe:: install_dependencies
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "#{node['php']['fpm_pooldir']}/atom.conf" do
  source 'atom.php-fpm.erb'
  notifies :restart, 'service[php-fpm]'
end

# Nginx configuration for AtoM
nginx_site 'atom' do
  template 'atom.nginx.erb'
  notifies :reload, 'service[nginx]'
end

# MySQL
include_recipe 'atom::configure_mysql'
