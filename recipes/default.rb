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

# Clone down AtoM into install dir
git "#{node['atom']['install_dir']}" do
  repository node['atom']['git_repo']
  revision node['atom']['git_revision']
end

# Compile AtoM less
execute 'compile-atom-css' do
  cwd "#{node['atom']['install_dir']}/plugins/arDominionPlugin"
  command "npm install && gulp && chown -R nginx:nginx #{node['atom']['install_dir']}"
end

# Create app.yml.erb from template
template "#{node['atom']['install_dir']}/config/app.yml" do
  source 'app.yml.erb'
  group node['nginx']['user']
  owner node['nginx']['user']
end

# Create factories.yml.erb from template
template "#{node['atom']['install_dir']}/config/factories.yml" do
  source 'factories.yml.erb'
  group node['nginx']['user']
  owner node['nginx']['user']
end

# Create uploads folder
directory "#{node['atom']['install_dir']}/uploads" do 
  group node['nginx']['user']
  owner node['nginx']['user']
end
