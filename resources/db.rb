#
# Cookbook:: atom
# Resource:: db
#
# Copyright:: 2019, Ryerson University Library

default_action :nothing

property :database_name, String, name_property: true
property :execute_user, String, default: 'root'
property :execute_group, String, default: 'root'
property :mysql_socket, String, default: '/tmp/mysql.sock'
property :mysql_user, String, required: true
property :mysql_password, String, required: true
property :database_file, String, required: true

action :backup do
  execute "mysql backup #{new_resource.database_name} database" do
    command "mysqldump -S #{new_resource.mysql_socket} -u #{new_resource.mysql_user} -p#{new_resource.mysql_password} #{new_resource.database_name} > #{new_resource.database_file}"
    user new_resource.execute_user
    group new_resource.execute_group
  end
end

action :restore do
  raise "Could not find file at #{new_resource.database_file}!" if !::File.exist?(new_resource.database_file)

  execute "mysql restore #{new_resource.database_name} database" do
    command "mysql -S #{new_resource.mysql_socket} -u #{new_resource.mysql_user} -p#{new_resource.mysql_password} #{new_resource.database_name} < #{new_resource.database_file}"
    user new_resource.execute_user
    group new_resource.execute_group
  end
end
