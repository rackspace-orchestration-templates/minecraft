from fabric.api import env, run, hide, task
from envassert import detect, file, port, process, service, user
from hot.utils.test import get_artifacts
import socket

@task
def check():
  env.platform_family = detect.detect()

  assert port.is_listening(25565), 'port 25535/minecraft is not listening'
  
  assert service.is_enabled('minecraft-server'), 'Minecraft Server is not enabled'

@task
def artifacts():
  env.platform_family = detect.detect()
  get_artifacts()
