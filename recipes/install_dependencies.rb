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
