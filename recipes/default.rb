#
# Cookbook Name:: atom
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if platform_family?('rhel', 'centos', 'fedora')
    include_recipe "atom::add_rpm_fusion"
end

node['atom']['packages'].each do |pkg|
    package pkg
end

include_recipe "atom::configure_mysql"
include_recipe "apache2"
include_recipe "php"

php_mysql_package_name = value_for_platform(
  %w(centos redhat scientific fedora amazon oracle) => {
    el5_range => 'php53-mysql',
    'default' => 'php-mysql'
  },
  'default' => 'php5-mysql'
)

package php_mysql_package_name

php_pear "imagick" do 
    action :install
end

include_recipe "java"
include_recipe "elasticsearch"
include_recipe "nodejs"


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
    repository node['atom']['git_repo']
    revision node['atom']['git_revision']
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