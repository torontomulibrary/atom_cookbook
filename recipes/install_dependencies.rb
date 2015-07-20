#
# Cookbook Name:: atom
# Recipe:: install_dependencies
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install package dependencies
package 'epel-release'
package %w(gearmand curl git)

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
include_recipe 'nginx'
nginx_site 'atom' do
  template 'atom.nginx.erb'
end

# MySQL, PHP
include_recipe 'atom::configure_mysql'
include_recipe 'atom::configure_php'
