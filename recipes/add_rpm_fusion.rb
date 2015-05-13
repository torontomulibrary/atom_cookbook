#
# Cookbook Name:: atom
# Recipe:: add_rpm_fusion
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Add RPM Fusion (Fedora20)
remote_file "#{Chef::Config[:file_cache_path]}/rpmfusion-free-release-20.noarch.rpm" do
    source 'http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-20.noarch.rpm'
end
remote_file "#{Chef::Config[:file_cache_path]}/rpmfusion-nonfree-release-20.noarch.rpm" do
    source 'http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-20.noarch.rpm'
end
rpm_package "#{Chef::Config[:file_cache_path]}/rpmfusion-free-release-20.noarch.rpm"
rpm_package "#{Chef::Config[:file_cache_path]}/rpmfusion-nonfree-release-20.noarch.rpm"