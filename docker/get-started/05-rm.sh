#!/bin/sh
set -x

# Stop running containers because `docker rm` cannot remove running
# containers.
docker stop $(docker ps -q)

# Remove all containers.
docker rm $(docker ps -qa)

# List containers. We should get no results.
docker ps -a
