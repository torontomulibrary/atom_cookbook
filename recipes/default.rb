#
# Cookbook Name:: atom
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

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
