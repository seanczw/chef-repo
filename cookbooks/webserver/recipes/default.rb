#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

# recipes/default.rb

package_name = case node['platform_family']
when 'debian'
  'apache2'
when 'rhel'
  'httpd'
end

# Install Apache
package package_name do
    action :install
end

# Start Apache
service package_name do
    action [:enable, :start]
end

# Create index file
file '/var/www/html/index.html' do
    content '<html>Welcome to the OSU Open Source Lab!</html>'
    action :create
end

#Remove telnet for security
['telnet', 'telnet-client'].each do |p|
  package p do
    action :remove
  end
end