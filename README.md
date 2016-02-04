Description
===========

#### Production


Instructions
===========

#### Getting Started
Review the settings for your server to make sure they are in line with the
game you wish to run. For example, you can set whether or not to allow pvp.
The configuration file is in /home/minecraft/. The server can be restarted
by restarting the "minecraft-server" service.

#### Lock it down
This deployment will create a Cloud Server with Minecraft. Once the
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
  * OS::Heat::SoftwareConfig
  * OS::Heat::SoftwareDeployment
  * OS::Nova::KeyPair
  * OS::Nova::Server
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

* `minecraft_difficulty`: Difficulty level for Minecraft.  0 - Peaceful, 1 - Easy, 2 - Normal, 3 - Hard (Default: 2)
* `minecraft_monsters`: Enable or disable spawning of hostile mobs (Default: True)
* `minecraft_hardcore`: Enable or disable Hardcore mode.  In Hardcore mode, users will be banned from the server upon death (Default: False)
* `minecraft_animals`: Enable or disable spawning of passive mobs (Default: True)
* `minecraft_npcs`: Enable or disable spawning of villagers (Default: True)
* `minecraft_motd`: Message to be displayed in the server list (Default: A Minecraft Server)
* `minecraft_max_players`: Maximum number of players able to connect at any given time (Default: 20)
* `minecraft_online`: Online mode requires clients to have a valid Minecraft account. (Default: True)
* `server_flavor`: Flavor of Cloud Server to use for Minecraft (Default: 4 GB General Purpose v1)

Outputs
=======
Once a stack comes online, use `heat output-list` to see all available outputs.
Use `heat output-show <OUTPUT NAME>` to get the value of a specific output.

* `minecraft_public_ip`: Server Public IP 
* `ssh_private_key`: SSH Private Key 

For multi-line values, the response will come in an escaped form. To get rid of
the escapes, use `echo -e '<STRING>' > file.txt`. For vim users, a substitution
can be done within a file using `%s/\\n/\r/g`.
