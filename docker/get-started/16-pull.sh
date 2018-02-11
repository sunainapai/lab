#!/bin/sh
set -x
docker rmi push-demo
docker rmi sunainapai/hello-world

docker images push-demo
docker images sunainapai/hello-world

docker pull sunainapai/hello-world
docker run sunainapai/hello-world
