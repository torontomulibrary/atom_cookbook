#
# Cookbook Name:: atom
# Recipe:: install_additional_repositories
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# RPMForge
if node['atom']['install_optional_packages']
  rpm = node['atom']['additional_repos'][:rpmforge]
  remote_file "#{Chef::Config[:file_cache_path]}/rpmforge.rpm" do
    source rpm
  end
  rpm_package "#{Chef::Config[:file_cache_path]}/rpmforge.rpm"
end

# Webtatic
rpm = node['atom']['additional_repos'][:webtatic]
remote_file "#{Chef::Config[:file_cache_path]}/webtatic.rpm" do
  source rpm
end
rpm_package "#{Chef::Config[:file_cache_path]}/webtatic.rpm"
