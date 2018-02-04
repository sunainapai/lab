#!/bin/sh
set -x
docker build -t expose-python-http 13-expose-python-http
netstat -na | grep 8080

set +x
echo Enter the following commands to check if port is exposed:
echo
echo     netstat -na \| grep LISTEN
echo     docker port foo
echo     curl http://localhost:8080/
echo
echo Also visit http://localhost:8080/ with web browser.
set -x

# In the following command, the EXPOSE instruction does not seem to be
# used.
docker rm foo
docker run --name foo -p 8080:8000 expose-python-http

# In the following command, the ports exposed with the EXPOSE
# instruction are exposed to high-order random ports on the host system.
docker rm foo
docker run --name foo -P expose-python-http
