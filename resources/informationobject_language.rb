#
# Cookbook:: atom
# Resource:: informationobject_language
#
# Copyright:: 2019, Ryerson University Library

default_action :create

property :language_code, String, name_property: true
property :language_name, String, required: true
property :directory, String, default: "#{node['atom']['install_dir']}/vendor/symfony/lib/i18n/data"

action :create do
  execute "'Add information object language option: #{new_resource.language_code}" do
    command build_add_language_command
    user 'nginx'
    group 'nginx'
    cwd new_resource.directory
  end
end

action_class do
  def build_add_language_command
    command = "php add_language.php en.dat Languages "
    command << "#{new_resource.language_code} "
    command << "#{new_resource.language_name}"
    command
  end
end
