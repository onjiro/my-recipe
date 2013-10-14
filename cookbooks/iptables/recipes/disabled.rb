#
# Cookbook Name:: iptables
# Recipe:: disaabled
#
# Copyright 2013, @onjiro.mohyahya
#
# All rights reserved - Do Not Redistribute
#
service 'iptables' do
  action ['stop', 'disable']
end
