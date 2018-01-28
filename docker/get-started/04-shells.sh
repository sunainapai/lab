#!/bin/sh
set -x
docker run -it ubuntu
docker run -it ubuntu bash
docker run -it ubuntu dash
docker run -it ubuntu uname -a
docker run -it ubuntu ps
docker run -it ubuntu bash -c "uname -a; ps"
