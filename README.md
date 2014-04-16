Description
===========

This is a template for deploying a [Minecraft](https://minecraft.net/) server
on a single Linux server with [OpenStack
Heat](https://wiki.openstack.org/wiki/Heat) on the [Rackspace
Cloud](http://www.rackspace.com/cloud/). This template is leveraging
[chef-solo](http://docs.opscode.com/chef_solo.html) to setup the server.

Requirements
============
* A Heat provider that supports the Rackspace `OS::Heat::ChefSolo` plugin.
* An OpenStack username, password, and tenant id.
* [python-heatclient](https://github.com/openstack/python-heatclient)
`>= v0.2.8`:

```bash
pip install python-heatclient
```

We recommend installing the client within a [Python virtual
environment](http://www.virtualenv.org/).

Example Usage
=============
Here is an example of how to deploy this template using the
[python-heatclient](https://github.com/openstack/python-heatclient):

```
heat --os-username <OS-USERNAME> --os-password <OS-PASSWORD> --os-tenant-id \
  <TENANT-ID> --os-auth-url https://identity.api.rackspacecloud.com/v2.0/ \
  stack-create Minecraft-Stack -f minecraft-server.yaml \
  -P server_hostname=MineStack -P ssh_keypair_name=mine-example
```

* For UK customers, use `https://lon.identity.api.rackspacecloud.com/v2.0/` as
the `--os-auth-url`.

Optionally, set environmental variables to avoid needing to provide these
values every time a call is made:

```
export OS_USERNAME=<USERNAME>
export OS_PASSWORD=<PASSWORD>
export OS_TENANT_ID=<TENANT-ID>
export OS_AUTH_URL=<AUTH-URL>
```

Parameters
==========
Parameters can be replaced with your own values when standing up a stack. Use
the `-P` flag to specify a custom parameter.

* `server_hostname`: Sets the hostname of the server. (Default: minecraft)
* `image`: Operating system to install (Default: Ubuntu 12.04 LTS (Precise
  Pangolin))
* `flavor`: Cloud server size to use. (Default: 4 GB Performance)
* `ssh_keypair_name`: Name of the SSH key pair to register with nova (Default:
  none)
* `minecraft_server_port`: Port to run the Minecraft server on (Default: 25565)
* `minecraft_gamemode`: 0-3: Survival, Creative, Adventure, or Spectator (Default: 0)
* `minecraft_spawn_animals`: Spawn animals (Default: true)
* `minecraft_spawn_npcs`: Spawn villagers (Default: true)
* `minecraft_spawn_monsters`: Spawn monsters (Default: true)
* `kitchen`: URL for the kitchen to clone with git. The Chef Solo run will copy
  all files in this repo into the kitchen for the chef run. (Default:
  https://github.com/rackspace-orchestration-templates/minecraft)
* `chef_version`: Chef client version to install for the chef run.  (Default:
  11.12.2)


Outputs
=======
Once a stack comes online, use `heat output-list` to see all available outputs.
Use `heat output-show <OUTPUT NAME>` to get the value fo a specific output.

* `private_key`: SSH private that can be used to login as root to the server.
* `server_ip`: Public IP address of the cloud server
* `server_port`: Minecraft server port used in the deployment

For multi-line values, the response will come in an escaped form. To get rid of
the escapes, use `echo -e '<STRING>' > file.txt`. For vim users, a substitution
can be done within a file using `%s/\\n/\r/g`.

Stack Details
=============
The Minecraft server is installed in /srv/minecraft. Once the server is online,
you should set a white-list in your
[server.properties](http://minecraft.gamepedia.com/Server.properties) file.
This will lock down your server to only players you specify. Any changes to the
server.properties file will require a restart of the Minecraft service.
Restarting can be completed by running:

`/etc/init.d/minecraft restart`

Contributing
============
There are substantial changes still happening within the [OpenStack
Heat](https://wiki.openstack.org/wiki/Heat) project. Template contribution
guidelines will be drafted in the near future.

License
=======
```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
