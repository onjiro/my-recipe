#
# Cookbook Name:: apache-test
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
service "iptables" do
  action :disable
end

directory "/var/www/html"

file "/var/www/html/index.html" do
  content <<-EOS
    It works!!
  EOS
end

web_app "sample" do
  server_name "192.168.56.10"
  server_aliases []
  docroot "/var/www/html"
  allowoverwrite "All"
  cookbook "apache2"
end
