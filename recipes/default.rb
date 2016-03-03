#
# Cookbook Name:: atom
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install AtoM Dependencies
include_recipe 'atom::install_dependencies'

# Create directory for AtoM
# directory "#{node['atom']['install_dir']}" do
#   recursive true
# end

# Clone down AtoM into install dir
git "#{node['atom']['install_dir']}" do
  repository node['atom']['git_repo']
  revision node['atom']['git_revision']
end

# Compile AtoM less
execute 'compile-atom-css' do
  cwd "#{node['atom']['install_dir']}/plugins/arDominionPlugin"
  command 'npm install && gulp'
end

# Create app.yml.erb from template
template "#{node['atom']['install_dir']}/config/app.yml" do
  source 'app.yml.erb'
end

# Create factories.yml.erb from template
template "#{node['atom']['install_dir']}/config/factories.yml" do
  source 'factories.yml.erb'
end

# Create uploads folder
directory "#{node['atom']['install_dir']}/uploads"

# Change owner to nginx:nginx
execute 'chown-nginx' do
  command "chown -R nginx:nginx #{node['atom']['install_dir']}"
end
