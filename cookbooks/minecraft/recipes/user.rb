#
# Cookbook Name:: minecraft
# Recipe:: user
#
# Copyright 2013, Greg Fitzgerald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

group node['minecraft']['group']

user node['minecraft']['user'] do
  system true
  comment 'Minecraft Server'
  home node['minecraft']['install_dir']
  gid node['minecraft']['group']
  shell '/bin/false'
  action :create
end
