#
# Cookbook Name:: atom
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "nodejs"
include_recipe "atom::install_mysql"
include_recipe "java"
include_recipe "elasticsearch"
include_recipe "apache2"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"

# Add RPM Fusion (Fedora20)
remote_file "#{Chef::Config[:file_cache_path]}/rpmfusion-free-release-20.noarch.rpm" do
    source 'http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-20.noarch.rpm'
end
remote_file "#{Chef::Config[:file_cache_path]}/rpmfusion-nonfree-release-20.noarch.rpm" do
    source 'http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-20.noarch.rpm'
end
rpm_package "#{Chef::Config[:file_cache_path]}/rpmfusion-free-release-20.noarch.rpm"
rpm_package "#{Chef::Config[:file_cache_path]}/rpmfusion-nonfree-release-20.noarch.rpm"

# Install optional dependencies
# imagemagick
case node['platform_family']
when 'rhel'
  package 'ImageMagick'
when 'debian', 'mac_os_x'
  package 'imagemagick'
end
# poppler-utils, ghostscript, ffmpeg
%w{ poppler-utils ghostscript ffmpeg }.each do |pkg|
    package pkg
end

# install git so we can pull down atom from a repository
package 'git'

# Create and enable our custom site.
web_app 'atom' do
    template 'atom.conf.erb'
end

# Create the directory where we will install atom
directory "#{node['atom']['install_dir']}" do
    mode '0755'
    owner 'apache'
    group 'apache'
end

# Clone the AtoM repository
git "#{node['atom']['install_dir']}" do
    repository "git://github.com/newbkaek/atom.git"
    revision "RULA/2.1.x" 
    user "apache"
    group "apache"
end

bash "compile-atom-css" do
    cwd "#{node['atom']['install_dir']}/plugins/arDominionPlugin"
    user "root"
    group "root"
    code <<-EOH
        npm install
        gulp
        chown apache:apache css/main.css
    EOH
end