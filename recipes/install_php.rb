#
# Cookbook Name:: atom
# Recipe:: install_php
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# grab the rpm repo and install it
remote_file "#{Chef::Config[:file_cache_path]}/webtatic.rpm" do
  source 'https://mirror.webtatic.com/yum/el6/latest.rpm'
end
rpm_package "#{Chef::Config[:file_cache_path]}/webtatic.rpm"

node['atom']['php_packages'].each do |install|
  package install
end

service "php-fpm" do
  service_name "php-fpm"
  supports :start => true, :stop => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
