#!/bin/sh

# This script should be run in a Linux VM because we want to see the
# processes running inside a container in the output of the `top`
# command run on the host. On macOS, the host kernel is not Linux, so
# the `top` command cannot see processes running in Docker containers
# that run in a separate Linux kernel packaged with Docker. Only on
# Linux, Docker would reuse the host Linux kernel to run Docker
# containers, so all processes running in the container are also running
# in the host kernel, so `top` command can display them.

set -x
docker build -t pymem 23-compose-limits-memory
docker swarm init
docker stack deploy -c 23-compose-limits-memory/docker-compose.yml pymem-stack

top -b -d 1 -n 60 | grep -E "Mem.*:|RES|python3"

docker stack rm pymem-stack
sleep 10
