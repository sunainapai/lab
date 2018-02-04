#!/bin/sh
set -x
docker build -t env-hello 11-env-hello
docker run env-hello sh -c 'echo FOO: $FOO; echo Foo: $Foo'
docker run env-hello sh -c 'echo BAR: $BAR; echo Bar: $Bar'
docker run env-hello sh -c 'ls -l hello.txt .txt'
