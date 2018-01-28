#!/bin/sh
set -x

docker ps
docker ps -a

docker run hello-world

# Currently running containers
docker ps

# All containers, even those that have exited
docker ps -a
