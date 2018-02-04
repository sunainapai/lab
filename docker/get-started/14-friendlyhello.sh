#!/bin/sh
set -x
docker build -t friendlyhello 14-friendlyhello
docker run -p 4000:80 friendlyhello
docker run -d -p 4000:80 friendlyhello
docker ps

set +x
echo
echo Remember to stop the container with: docker stop \<container id\>.
echo
