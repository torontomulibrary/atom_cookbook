#
# Cookbook Name:: atom
# Recipe:: configure_mysql
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mysql_service 'mysqld' do
  port '3306'
  bind_address '127.0.0.1'
  version "#{node['atom']['mysql_version']}"
  initial_root_password "#{node['atom']['mysql_password']}"
  action [:create, :start]
end

# Install mysql2_chef_gem to set up databases
mysql2_chef_gem 'default' do 
  action :install
end

# Set up AtoM database
mysql_database "#{node['atom']['database_name']}" do
  connection(
    :host => '127.0.0.1',
    :username => 'root',
    :socket => '/var/run/mysql-mysqld/mysqld.sock',
    :password => node['atom']['mysql_password']
    )
end

# Create database user 'atom' and grant all priveleges
mysql_connection_info = {
  :host => '127.0.0.1',
  :username => 'root',
  :password => node['atom']['mysql_password']
}
mysql_database_user "#{node['atom']['database_user']}" do
  connection mysql_connection_info
  password "#{node['atom']['database_user_password']}"
  database_name "#{node['atom']['database_name']}"
  action :grant
end