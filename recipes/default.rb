#
# Cookbook Name:: atom
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Clone down AtoM into install dir
git node['atom']['install_dir'] do
  repository node['atom']['git_repo']
  revision node['atom']['git_revision']
end

# Compile AtoM less
execute 'compile-atom-css' do
  cwd "#{node['atom']['install_dir']}/plugins/arDominionPlugin"
  command "npm install && gulp && chown -R nginx:nginx #{node['atom']['install_dir']}"
end

# Create app.yml.erb from template
template "#{node['atom']['install_dir']}/config/app.yml" do
  source 'app.yml.erb'
  owner 'nginx'
  group 'nginx'
end

# Create factories.yml.erb from template
template "#{node['atom']['install_dir']}/config/factories.yml" do
  source 'factories.yml.erb'
  owner 'nginx'
  group 'nginx'
end

# Create uploads folder
directory "#{node['atom']['install_dir']}/uploads" do
  owner 'nginx'
  group 'nginx'
end

# Clone plugins from git
node['atom']['plugins'].each do |plugin|
  directory "#{node['atom']['install_dir']}/plugins/#{plugin['name']}" do
    action :delete
    recursive true
    only_if { plugin['override_core'] }
  end

  git "#{node['atom']['install_dir']}/plugins/#{plugin['name']}" do
    repository plugin['git_repo']
    revision plugin['git_revision'] || 'master'
    user 'nginx'
    group 'nginx'
  end

  # Run gulp to compile less
  execute 'compile theme' do
    cwd "#{node['atom']['install_dir']}/plugins/#{plugin['name']}"
    command "npm install && gulp && chown -R nginx:nginx #{node['atom']['install_dir']}"
    only_if { plugin['gulp'] }
  end
end

# Install, enable, and start the atom async worker service
systemd_unit 'atom-worker.service' do
  content({
    Unit: {
      Description: 'AtoM Asynchronous Gearman Worker',
      After: 'gearmand.service',
    },
    Install: {
      WantedBy: 'multi-user.target',
    },
    Service: {
      Type: 'simple',
      User: 'nginx',
      Group: 'nginx',
      WorkingDirectory: node['atom']['install_dir'],
      ExecStart: "#{node['atom']['php']['php_binary']} -d memory_limit=-1 -d error_reporting=\"E_ALL\" symfony jobs:worker",
      ExecStop: '/bin/kill -s TERM $MAINPID',
      Restart: 'always',
      RestartSec: '1',
      StartLimitBurst: '5',
      StartLimitInterval: '0',
    }
  })
  action [ :create, :enable, :start ]
end
