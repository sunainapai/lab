#!/bin/sh
set -x
docker build -t pyhttp 19-compose-replicas-ports
docker swarm init
docker stack deploy -c 19-compose-replicas-ports/docker-compose.yml pyhttp-stack

sleep 10
docker stack ls
docker service ls
docker ps

curl http://localhost:8080/etc/hostname
curl http://localhost:8080/etc/hostname
curl http://localhost:8080/etc/hostname
curl http://localhost:8080/etc/hostname
curl http://localhost:8080/etc/hostname
curl http://localhost:8080/etc/hostname

docker exec -it "$(curl -s http://localhost:8080/etc/hostname)" netstat -t
docker exec -it "$(curl -s http://localhost:8080/etc/hostname)" netstat -t
docker exec -it "$(curl -s http://localhost:8080/etc/hostname)" netstat -t

docker exec -it "$(curl -s http://localhost:8080/etc/hostname)" netstat -l
docker exec -it "$(curl -s http://localhost:8080/etc/hostname)" netstat -l
docker exec -it "$(curl -s http://localhost:8080/etc/hostname)" netstat -l

set +x
echo
echo Press ENTER to remove the stack.
read
set -x

docker stack rm pyhttp-stack
