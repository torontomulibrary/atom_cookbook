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

php_packages = %w{
  php56w 
  php56w-opcache
  php56w-common 
  php56w-mysql 
  php56w-xml 
  php56w-ldap 
  php56w-pecl-apcu 
  php56w-mbstring
  php56w-fpm 
}

php_packages.each do |install|
  package install
end

service "php-fpm" do
  service_name "php-fpm"
  supports :start => true, :stop => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
