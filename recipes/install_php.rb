#
# Cookbook Name:: atom
# Recipe:: install_php
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node['atom']['php_packages'].each do |install|
  package install
end

service "php-fpm" do
  service_name "php-fpm"
  supports :start => true, :stop => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
