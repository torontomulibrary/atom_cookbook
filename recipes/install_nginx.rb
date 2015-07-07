#
# Cookbook Name:: atom
# Recipe:: install_nginx
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'
template '/etc/nginx/sites-available/atom' do
  source 'atom.nginx.erb'
  notifies :reload, 'service[nginx]', :delayed
end
nginx_site 'atom'
