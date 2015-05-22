#
# Cookbook Name:: atom
# Recipe:: add_rpm_fusion
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Add the EPEL repo if CentOS
# should we move this into the default recipe??
# TODO: add support for other platform_version numbers
if node['platform'] == "centos"
  if 6 <= node['platform_version'].to_f && node['platform_version'].to_f < 7
    epel_source_url = 'http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm'
  end

  remote_file "#{Chef::Config[:file_cache_path]}/epel-release.rpm" do
    source epel_source_url
  end
  rpm_package "#{Chef::Config[:file_cache_path]}/epel-release.rpm"
end

# select source based on platform version
case node['platform_family']
when "rhel"
  if node['platform_version'].to_f < 6
    # TODO: Add support for versions < 6
  else
    free_release_url = 'http://download1.rpmfusion.org/free/el/updates/6/i386/rpmfusion-free-release-6-1.noarch.rpm'
    nonfree_release_url = 'http://download1.rpmfusion.org/nonfree/el/updates/6/i386/rpmfusion-nonfree-release-6-1.noarch.rpm'
  end
when "fedora"
  # TODO: Add support for fedora
end

# Add RPM Fusion
remote_file "#{Chef::Config[:file_cache_path]}/rpmfusion-free-release.rpm" do
  source free_release_url
end
remote_file "#{Chef::Config[:file_cache_path]}/rpmfusion-nonfree-release.rpm" do
  source nonfree_release_url
end
rpm_package "#{Chef::Config[:file_cache_path]}/rpmfusion-free-release.rpm"
rpm_package "#{Chef::Config[:file_cache_path]}/rpmfusion-nonfree-release.rpm"