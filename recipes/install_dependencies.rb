#
# Cookbook Name:: atom
# Recipe:: install_dependencies
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install additional repositories
node['atom']['additional_repos'].each do |rpm, url|
  remote_file "#{Chef::Config[:file_cache_path]}/#{rpm}.rpm" do
    source url
  end
  rpm_package "#{Chef::Config[:file_cache_path]}/#{rpm}.rpm"
end

# Install package dependencies
# fop is optional, but it fudges with Java1.8, so we install it beforehand
package %w(epel-release curl git fop)

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

# Install optional package dependencies
package node['atom']['optional_packages']
