#!/bin/sh
set -x
docker build -t pyhttp 18-compose-ports
docker swarm init
docker stack deploy -c 18-compose-ports/docker-compose.yml pyhttp-stack

sleep 10
docker stack ls
docker service ls
docker ps

curl http://localhost:8080/etc/hostname

docker exec -it "$(docker ps -q | head -n 1)" netstat -t

set +x
echo
echo Press ENTER to remove the stack.
read
set -x

docker stack rm pyhttp-stack
