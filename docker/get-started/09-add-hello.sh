#!/bin/sh
set -x
docker build -t add-hello 09-add-hello
docker images
docker run add-hello
docker run add-hello ls -l /hello.txt /hello.sh
