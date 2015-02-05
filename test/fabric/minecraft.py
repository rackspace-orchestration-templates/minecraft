from fabric.api import env, run, task
from envassert import detect, file, group, package, port, process, service, \
    user
from hot.utils.test import get_artifacts, http_check



@task
def check():
    env.platform_family = detect.detect()

    assert file.exists('/srv/minecraft/minecraft_server.1.8.jar'), \
        '/srv/minecraft/minecraft_server.1.8.jar does not exist'

    assert port.is_listening(25565), 'port 25565/java is not listening'

    assert user.exists('mcserver'), 'user mcserver does not exist'

    assert group.is_exists('mcserver'), 'group mcserver does not exist'

    assert process.is_up('java'), 'process java is not running'

    assert service.is_enabled('minecraft'), 'service minecraft is not enabled'


@task
def artifacts():
    env.platform_family = detect.detect()
    get_artifacts()
