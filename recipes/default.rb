#
# Cookbook:: mywebserver
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package_name =
  service_name =
    case node['platform']
    when 'centos' then 'httpd'
    when 'ubuntu' then 'apache2'
    end

# package 'httpd'
package package_name

# service 'httpd' do
#  action [:enable, :start]
# end
service service_name do
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

=begin

# node.default["attribute"] = "from the recipe file"

# puts node.default["attribute"]

# package 'httpd'

# service 'httpd' do
#  action [:enable, :start]
# end

=end
