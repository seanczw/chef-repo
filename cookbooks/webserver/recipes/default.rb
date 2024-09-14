#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

# recipes/default.rb

# Install Apache
package 'apache2' do
    action :install
end

# Start Apache
service 'apache2' do
    action [:enable, :start]
end

# Create index file
file '/var/www/html/index.html' do
    content '<html>Welcome to the OSU Open Source Lab!</html>'
    action :create
end
