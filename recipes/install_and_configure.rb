#
# Cookbook Name:: atom
# Recipe:: install_and_configure
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Clone down AtoM
directory "#{node['atom']['install_dir']}" do
  mode '0755'
  owner 'nginx'
  group 'nginx'
end

git "#{node['atom']['install_dir']}" do
  repository node['atom']['git_repo']
  revision node['atom']['git_revision']
  user 'nginx'
  group 'nginx'
end

bash 'compile-atom-css' do
  cwd "#{node['atom']['install_dir']}/plugins/arDominionPlugin"
  user 'root'
  group 'root'
  code <<-EOH
  npm install
  gulp
  chown nginx:nginx css/main.css
  EOH
end

directory "#{node['atom']['install_dir']}/uploads" do
  mode '0755'
  user 'nginx'
  group 'nginx'
end
