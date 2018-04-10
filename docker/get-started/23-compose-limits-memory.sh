#!/bin/sh
set -x
docker build -t pymem 23-compose-limits-memory
docker swarm init
docker stack deploy -c 23-compose-limits-memory/docker-compose.yml pymem-stack

top -b -d 1 -n 60 | grep -E "Mem.*:|RES|python3"

docker stack rm pymem-stack
sleep 10
