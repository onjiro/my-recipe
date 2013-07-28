#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2013, onjiro
#
# All rights reserved - Do Not Redistribute
#
(node[:users] or []).each do |target_user|
  git "dotfiles" do
    destination "/home/#{target_user}/dotfiles"
    repository "https://github.com/onjiro/dotfiles.git"
    user target_user
  end
end
