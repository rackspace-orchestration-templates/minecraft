#
# Cookbook Name:: minecraft
# Attributes:: properties
#
# Copyright 2013, Greg Fitzgerald.
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Default server properties
# http://minecraft.gamepedia.com/Server.properties#Minecraft_server_properties
default['minecraft']['properties']['allow-flight']          = false
default['minecraft']['properties']['allow-nether']          = true
default['minecraft']['properties']['difficulty']            = 1
default['minecraft']['properties']['enable-query']          = false
default['minecraft']['properties']['enable-rcon']           = false
default['minecraft']['properties']['enable-command-block']  = false
default['minecraft']['properties']['force-gamemode']        = false
default['minecraft']['properties']['gamemode']              = 0
default['minecraft']['properties']['generate-structures']   = true
default['minecraft']['properties']['hardcore']              = false
default['minecraft']['properties']['level-name']            = 'world'
default['minecraft']['properties']['level-seed']            = ''
default['minecraft']['properties']['level-type']            = 'DEFAULT'
default['minecraft']['properties']['max-build-height']      = '256'
default['minecraft']['properties']['max-players']           = '20'
default['minecraft']['properties']['motd']                  = 'A Minecraft Server'
default['minecraft']['properties']['online-mode']           = true
default['minecraft']['properties']['op-permission-level']   = 4
default['minecraft']['properties']['player-idle-timeout']   = 0
default['minecraft']['properties']['pvp']                   = true
default['minecraft']['properties']['query.port']            = '25565'
default['minecraft']['properties']['rcon.password']         = ''
default['minecraft']['properties']['rcon.port']             = '25575'
default['minecraft']['properties']['server-ip']             = ''
default['minecraft']['properties']['server-name']           = 'Unknown Server'
default['minecraft']['properties']['server-port']           = '25565'
default['minecraft']['properties']['snooper-enabled']       = true
default['minecraft']['properties']['spawn-animals']         = true
default['minecraft']['properties']['spawn-monsters']        = true
default['minecraft']['properties']['spawn-npcs']            = true
default['minecraft']['properties']['spawn-protection']      = 16
default['minecraft']['properties']['texture-pack']          = ''
default['minecraft']['properties']['view-distance']         = 10
default['minecraft']['properties']['white-list']            = false
