#!/bin/sh
set -x
docker run busybox ls
docker run busybox uname -a
docker ps -a
docker images
