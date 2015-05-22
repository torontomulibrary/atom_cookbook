#
# Cookbook Name:: atom
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "atom::add_rpm_fusion"
node['atom']['install_packages'].each do |install|
  package install
end

# MySQL
include_recipe "atom::configure_mysql"

# Java & Elasticsearch
include_recipe "java"
include_recipe "elasticsearch"

# Nginx
include_recipe "nginx"

template "/etc/nginx/sites-available/atom" do
  source "atom.nginx.erb"
  notifies :reload, 'service[nginx]', :delayed
end
nginx_site "atom"

# PHP
include_recipe "atom::install_php"

template "/etc/php-fpm.d/atom.conf" do
  source "atom.php-fpm.erb"
  notifies :reload, 'service[php-fpm]', :delayed
end

# Clone down AtoM
package 'git'
include_recipe "nodejs"

directory "#{node['atom']['install_dir']}" do
  mode '0755'
  owner 'nginx'
  group 'nginx'
end

git "#{node['atom']['install_dir']}" do
  repository node['atom']['git_repo']
  revision node['atom']['git_revision']
  user "nginx"
  group "nginx"
end

bash "compile-atom-css" do
  cwd "#{node['atom']['install_dir']}/plugins/arDominionPlugin"
  user "root"
  group "root"
  code <<-EOH
  npm install
  gulp
  chown nginx:nginx css/main.css
  EOH
end

directory "#{node['atom']['install_dir']}/uploads" do
  mode "0755"
  user "nginx"
  group "nginx"
end