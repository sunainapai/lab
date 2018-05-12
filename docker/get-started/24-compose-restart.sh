#!/bin/sh
set -x
docker rmi -f pyexit
docker build -t pyexit 24-compose-restart
docker swarm init
docker stack deploy -c 24-compose-restart/docker-compose.yml pyexit-stack

set +x
i=0
while [ $i -lt 60 ]
do
    echo i=$i
    docker service ls | grep -v ID
    docker ps | grep -v ID
    sleep 1
    i=$(( $i + 1 ))
done
set -x

docker stack rm pyexit-stack
sleep 10
