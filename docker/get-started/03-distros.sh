#!/bin/sh
set -x
docker pull busybox
docker pull alpine
docker pull debian
docker pull ubuntu
docker pull centos
docker images
