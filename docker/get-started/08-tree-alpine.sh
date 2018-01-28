#!/bin/sh
set -x
docker build -t tree-alpine 08-tree-alpine
docker images
docker run tree-alpine
