#!/bin/sh
set -x
docker build -t workdir-abc 10-workdir-abc
docker images
docker run workdir-abc pwd
docker run workdir-abc sh -c 'ls /?'
docker run workdir-abc cat /b/b.txt

set +x
echo
echo Press ^d or enter 'exit' to exit the shell below ...
echo
set -x

docker run -it workdir-abc
