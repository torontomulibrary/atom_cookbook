#
# Cookbook Name:: atom
# Recipe:: install_php
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# This recipe is specific to CentOS!
case node['platform_version'].to_i
when 5
  webtatic_source_url = 'http://mirror.webtatic.com/yum/el5/latest.rpm'
when 6
  webtatic_source_url = 'https://mirror.webtatic.com/yum/el6/latest.rpm'
when 7
  webtatic_source_url = 'https://mirror.webtatic.com/yum/el7/webtatic-release.rpm'
end

remote_file "#{Chef::Config[:file_cache_path]}/webtatic.rpm" do
  source webtatic_source_url
end
rpm_package "#{Chef::Config[:file_cache_path]}/webtatic.rpm"

php_packages = %w(php55w php55w-opcache php55w-common php55w-mysql php55w-xml
                  php55w-ldap php55w-pecl-apcu php55w-mbstring php55w-fpm )

php_packages.each do |install|
  package install
end

service 'php-fpm' do
  service_name 'php-fpm'
  supports start: true, stop: true, restart: true, reload: true
  action [:enable, :start]
end

template '/etc/php.ini' do
  source 'php.ini.erb'
  notifies :reload, 'service[php-fpm]', :delayed
end

template '/etc/php-fpm.d/atom.conf' do
  source 'atom.php-fpm.erb'
  notifies :reload, 'service[php-fpm]', :delayed
end
