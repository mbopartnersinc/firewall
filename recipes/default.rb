#
# Cookbook Name:: firewall
# Recipe:: default
#
# Copyright 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'chef-sugar'

firewall 'default' do
  action :install
end

firewall_rule 'allow world to ssh' do
  port 22
  source '0.0.0.0/0'
  # default action is :create
  # default iptables command is :append
  only_if { linux? && node['firewall']['allow_ssh'] }
end

firewall_rule 'allow world to winrm' do
  port 5989
  source '0.0.0.0/0'
  # default action is :create
  # default iptables command is :append
  only_if { windows? && node['firewall']['allow_winrm'] }
end
