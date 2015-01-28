[![Circle CI](https://circleci.com/gh/rackspace-orchestration-templates/minecraft.png?style=badge)](https://circleci.com/gh/rackspace-orchestration-templates/minecraft)
Description
===========

This is a Heat template to deploy a single Linux server running a Minecraft
server.  The Minecraft server will be setup leveraging Chef solo.


Instructions
===========

#### Getting Started
Review the settings for your server to make sure they are in line with the
game you wish to run. For example, you can set whether or not to allow pvp.
The configuration file is in /srv/minecraft.

#### Lock it down
This deployment will create a Cloud Server with Minecraft 1.8. Once the
server is online, you should set a white-list in your
[server.properties](http://minecraft.gamepedia.com/Server.properties)
file. This will lock down your server to only players you specify.

#### Logging in via SSH
The private key provided in the passwords section can be used to login as
root via SSH. We have an article on how to use these keys with [Mac OS X and
Linux](http://www.rackspace.com/knowledge_center/article/logging-in-with-a-ssh-private-key-on-linuxmac)
as well as [Windows using
PuTTY](http://www.rackspace.com/knowledge_center/article/logging-in-with-a-ssh-private-key-on-windows).


Requirements
============
* A Heat provider that supports the following:
  * OS::Heat::ChefSolo
  * OS::Nova::KeyPair
  * Rackspace::Cloud::Server
* An OpenStack username, password, and tenant id.
* [python-heatclient](https://github.com/openstack/python-heatclient)
`>= v0.2.8`:

```bash
pip install python-heatclient
```

We recommend installing the client within a [Python virtual
environment](http://www.virtualenv.org/).

Parameters
==========
Parameters can be replaced with your own values when standing up a stack. Use
the `-P` flag to specify a custom parameter.

* `server_hostname`: Hostname to use for setting the server name. (Default: minecraft)
* `image`: Server image used for all servers that are created as a part of this
deployment
 (Default: Ubuntu 14.04 LTS (Trusty Tahr) (PV))
* `flavor`: Rackspace Cloud Server flavor to use. The size is based on the amount of
RAM for the provisioned server.
 (Default: 4 GB General Purpose v1)
* `terms`: Required: You must agree to the Minecraft EULA found here:
https://account.mojang.com/documents/minecraft_eula
 
* `minecraft_server_port`: Port to run Minecraft server on (Default: 25565)
* `minecraft_gamemode`: Mode of gameplay (Default: 0)
* `minecraft_spawn_animals`: Spawn animals (Default: true)
* `minecraft_spawn_npcs`: Spawn villagers (Default: true)
* `minecraft_spawn_monsters`: Spawn monsters (Default: true)
* `minecraft_version`: Version of minecraft to install (Default: 1.8)
* `kitchen`: URL for the kitchen to use (Default: https://github.com/rackspace-orchestration-templates/minecraft)
* `chef_version`: Version of chef client to use (Default: 11.16.0)

Outputs
=======
Once a stack comes online, use `heat output-list` to see all available outputs.
Use `heat output-show <OUTPUT NAME>` to get the value of a specific output.

* `private_key`: SSH Private Key 
* `server_ip`: Server IP 
* `server_port`: Minecraft Port 

For multi-line values, the response will come in an escaped form. To get rid of
the escapes, use `echo -e '<STRING>' > file.txt`. For vim users, a substitution
can be done within a file using `%s/\\n/\r/g`.
