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

bash "add-rpmfusion" do
    user "root"
    group "root"
    code <<-EOH
        rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm
    EOH
end

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


# Install git, PHP-APC (required for caching), PHP-mbstring
%w{ git php-pecl-apc php-mbstring make }.each do |pkg|
    package pkg do
        action :install
        notifies :reload, 'service[apache2]', :delayed
    end
end

# Create and enable our custom site.
web_app 'atom' do
    template 'atom.conf.erb'
end

directory "#{node['atom']['install_dir']}" do
    mode '0755'
    owner 'apache'
    group 'apache'
end

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