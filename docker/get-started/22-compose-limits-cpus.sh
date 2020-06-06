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
docker build -t pyloop 22-compose-limits-cpus
docker swarm init
docker stack deploy -c 22-compose-limits-cpus/docker-compose.yml pyloop-stack

top -b -d 1 -n 30 | grep -E "CPU|python3"

docker stack rm pyloop-stack
sleep 10
