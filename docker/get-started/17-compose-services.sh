#!/bin/sh
set -x
docker build -t pyhttp-compose 17-compose-services
docker swarm init
docker stack deploy -c 17-compose-services/docker-compose.yml pyhttp-stack

sleep 10
docker stack ls
docker service ls

set +x
echo
echo Press ENTER to stop the stack.
read
set -x

docker stack rm pyhttp-stack
