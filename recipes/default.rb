#
# Cookbook Name:: atom
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install RPM Fusion if OS is RHEL/Fedora
if platform_family?('rhel', 'fedora')
    include_recipe "atom::add_rpm_fusion"
end

# install dependency packages
node['atom']['packages'].each do |pkg|
    package pkg
end

include_recipe "atom::configure_mysql"
include_recipe "apache2"

include_recipe "php"
php_pear "imagick"

include_recipe "java"
include_recipe "elasticsearch"
include_recipe "nodejs"

# Create and enable our custom site using the apache2 web_app resource
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
    repository node['atom']['git_repo']
    revision node['atom']['git_revision']
    user "apache"
    group "apache"
end

# add the uploads directory so the first upload does not bug out!
directory "#{node['atom']['install_dir']}/uploads" do
  mode "0755"
  user "apache"
  group "apache"
end

# compile the css for AtoM
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

# inject our php.ini file, because we want larger uploads!
cookbook_file "php.ini" do
    path "/etc/php.ini"
    notifies :restart, 'service[apache2]', :delayed
end
