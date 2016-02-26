#
# Cookbook Name:: atom
# Recipe:: install_dependencies
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Enable extended repositories
include_recipe 'yum-epel'

# Install package dependencies
package %w(curl git gearmand)

# Include webtatic for EL6 releases
if platform_family?('rhel') && node['platform_version'].to_i == 6
  webtatic_rpm = 'https://mirror.webtatic.com/yum/el6/latest.rpm'
  remote_file "#{Chef::Config[:file_cache_path]}/webtatic.rpm" do
    source webtatic_rpm
  end
  rpm_package "#{Chef::Config[:file_cache_path]}/webtatic.rpm"
end

# Install optional packages & dependencies
if node['atom']['install_optional_packages']

  node['atom']['additional_repos'].each do |repo, url|
    remote_file "#{Chef::Config[:file_cache_path]}/#{repo}.rpm" do
      source url
    end
    rpm_package "#{Chef::Config[:file_cache_path]}/#{repo}.rpm"
  end

  package node['atom']['optional_packages']
end

# Node.js
include_recipe 'nodejs'
nodejs_npm 'less gulp'

# Java & Elasticsearch
include_recipe 'java'
include_recipe 'elasticsearch'

# Nginx
# include_recipe 'nginx'
nginx_site 'atom' do
  template 'atom.nginx.erb'
  notifies :reload, 'service[nginx]', :delayed
end

# MySQL, PHP
include_recipe 'atom::configure_mysql'
include_recipe 'atom::configure_php'
