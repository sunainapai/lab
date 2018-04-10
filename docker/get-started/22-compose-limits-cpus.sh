#!/bin/sh
set -x
docker build -t pyloop 22-compose-limits-cpus
docker swarm init
docker stack deploy -c 22-compose-limits-cpus/docker-compose.yml pyloop-stack

top -b -d 1 -n 30 | grep -E "CPU|python3"

docker stack rm pyloop-stack
sleep 10
