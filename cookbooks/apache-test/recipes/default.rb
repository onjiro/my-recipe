#
# Cookbook Name:: apache-test
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
["php", "php-mysql", "php-mbstring", "php-pear", "mysql", "mysql-server", "httpd", "mod_ssl"].each do |dependency|
  package dependency
end

# services
["mysqld", "httpd"].each do |one|
  service one do
    action [:enable, :start]
  end
end
service "iptables" do
  action [:disable, :stop]
end

# psedo-checkout
directory "var/www/apache-test"
file "/var/www/apache-test/index.html" do
  content "It works!!"
end

# link
unless File.symlink? "var/www/html"
  directory "/var/www/html" do
    action :delete
    recursive true
  end

  link "/var/www/html" do
    to "/var/www/apache-test"
  end
end

# まじめにやるならopscode-cookbooks/databaseを使う
unless system "mysql -D test_db -u root < /dev/null"
  execute "echo 'create database test_db' | mysql -u root"
  # todo migration
end
