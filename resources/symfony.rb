#
# Cookbook:: atom
# Resource:: symfony
#
# Copyright:: 2019, Ryerson University Library

default_action :run

property :symfony_command, String, name_property: true
property :flags, Array, default: []
property :directory, String, default: node['atom']['install_dir']

action :run do
  execute "symfony #{new_resource.symfony_command}" do
    command build_symfony_command
    user 'nginx'
    group 'nginx'
    cwd new_resource.directory
  end
end

action_class do
  def expand_flags(flags)
    flags.join(' ')
  end

  def build_symfony_command
    command = 'php -d memory_limit=2048M symfony '
    command << "#{new_resource.symfony_command}#{expand_flags(new_resource.flags)}"
    command
  end
end
