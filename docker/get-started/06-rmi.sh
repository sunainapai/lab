#!/bin/sh
set -x
docker rmi $(docker images -q)
docker images
