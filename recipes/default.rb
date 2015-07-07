#
# Cookbook Name:: atom
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install EPEL repositories
package 'epel-release' if node['platform_family'] == 'rhel'

%w(curl git) .each do |install|
  package install
end

# Node.js
include_recipe 'atom::install_nodejs'

# MySQL
include_recipe 'atom::configure_mysql'

# Java & Elasticsearch
include_recipe 'java'
include_recipe 'elasticsearch'

# Nginx
include_recipe 'atom::install_nginx'

# PHP
include_recipe 'atom::install_php'

# Atom Additional Dependencies
include_recipe 'atom::install_atom_dependencies'

# Install and configure AtoM
include_recipe 'atom::install_and_configure'
