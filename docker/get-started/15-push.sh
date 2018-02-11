#!/bin/sh
set -x
docker build -t push-demo 15-push
docker tag push-demo sunainapai/hello-world
docker push sunainapai/hello-world

set +x
echo
echo Go to https://hub.docker.com/ and/or https://cloud.docker.com/ to
echo see the new hello-world repository. 
echo
