#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2013, onjiro
#
# All rights reserved - Do Not Redistribute
#
package "zsh"

(node[:users] or []).each do |target_user|
  user target_user do
    name target_user
    shell "/bin/zsh"
  end
end
