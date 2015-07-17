#
# Cookbook Name:: atom
# Recipe:: install_dependencies
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'atom::install_additional_repositories'

# Install package dependencies
package %w(epel-release curl git gearmand)

# fop is optional, but it fudges with Java1.8, so we install it beforehand
package 'fop' if node['atom']['install_optional_packages']

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

# # Install optional package dependencies
package node['atom']['optional_packages'] if node['atom']['install_optional_packages']
