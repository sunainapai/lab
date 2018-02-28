#!/bin/sh
set -x
docker build -t pyhttp 21-compose-multiple-networks
docker swarm init
docker stack deploy -c 21-compose-multiple-networks/docker-compose.yml pyhttp-stack

sleep 10
docker stack ls
docker service ls
docker ps

docker exec -it $(curl -s http://localhost:8080/etc/hostname) \
       sh -c 'ifconfig | grep -E "encap:|addr:"'

set +x
echo
echo Press ENTER to remove the stack.
read
set -x

docker stack rm pyhttp-stack
sleep 10
