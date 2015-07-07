#
# Cookbook Name:: atom
# Recipe:: install_atom_dependencies
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node['platform_version'].to_i
when 5
  mirrorlist_url = 'http://mirrorlist.repoforge.org/el5/mirrors-rpmforge'
when 6, 2013, 2014, 2015
  mirrorlist_url = 'http://mirrorlist.repoforge.org/el6/mirrors-rpmforge'
when 7
  mirrorlist_url = 'http://mirrorlist.repoforge.org/el7/mirrors-rpmforge'
end

# CentOS 5
yum_repository 'rpmforge' do
  mirrorlist mirrorlist_url
  description 'RHEL $releasever - RPMforge.net - dag'
  enabled true
  gpgcheck true
  gpgkey 'http://apt.sw.be/RPM-GPG-KEY.dag.txt'
end

atom_dependency_packages = %w(
  ImageMagick
  ImageMagick-devel
  ghostscript
  poppler-utils
  ffmpeg
)
atom_dependency_packages.each do |install|
  package install
end
