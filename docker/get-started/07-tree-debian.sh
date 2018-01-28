#!/bin/sh
set -x
docker build -t tree-debian 07-tree-debian
docker images
docker run tree-debian
