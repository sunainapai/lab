#!/bin/sh
set -x
docker build -t pyhttp 17-compose-services
docker swarm init
docker stack deploy -c 17-compose-services/docker-compose.yml pyhttp-stack

# $ docker stack deploy ...
# Creating network pyhttp-stack_default
# Creating service pyhttp-stack_pyhttp-svc

sleep 10
docker stack ls
docker service ls

# $ docker stack ls
# NAME                SERVICES            ORCHESTRATOR
# pyhttp-stack        1                   Swarm
#
# $ docker service ls
# ID                  NAME                      MODE                REPLICAS            IMAGE                   PORTS
# rzq1tjgnhxs3        pyhttp-stack_pyhttp-svc   replicated          1/1                 pyhttp:latest

# The following points appear to be true:
#
#   - A stack is deployed to swarm.
#   - A stack contains services.
#   - A service is the set of replica containers of an image.

set +x
echo
echo Press ENTER to remove the stack.
read
set -x

docker stack rm pyhttp-stack

# $docker stack rm pyhttp-stack
# Removing service pyhttp-stack_pyhttp-svc
# Removing network pyhttp-stack_default

# Removing the stack removes the stack and its services, i.e., stop the
# containers.
