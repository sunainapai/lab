#!/bin/sh
set -x
docker build -t python-http 12-python-http
netstat -na | grep 8080

set +x
echo Enter the following commands to check if port is exposed:
echo
echo     netstat -na \| grep LISTEN
echo     curl http://localhost:8080/
echo
echo Also visit http://localhost:8080/ with web browser.
set -x

docker run -it -p 8080:8000 python-http

# Without the -it option, the server logs were not appearing on the
# terminal. Neither could the server be stopped by pressing Ctrl+C.

# Without the -p 8080:8000 port option, port 8080 is not open on the
# host system (e.g., the Mac system).
