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

docker run -d -it -p 8080:8000 python-http
sleep 10

docker ps

curl http://localhost:8080/etc/hostname
docker exec -it "$(docker ps -q | head -n 1)" netstat -nt
docker exec -it "$(docker ps -q | head -n 1)" netstat -l

# docker ps
# CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
# 34078b03bdf2        python-http         "/bin/sh -c 'python3…"   10 seconds ago      Up 10 seconds       0.0.0.0:8080->8000/tcp   determined_benz

# curl http://localhost:8080/etc/hostname
# 34078b03bdf2

# docker exec -it 34078b03bdf2 netstat -nt
# Active Internet connections (w/o servers)
# Proto Recv-Q Send-Q Local Address           Foreign Address         State
# tcp        0      0 172.17.0.2:8000         172.17.0.1:55958        TIME_WAIT

# docker exec -it 34078b03bdf2 netstat -l
# Active Internet connections (only servers)
# Proto Recv-Q Send-Q Local Address           Foreign Address         State
# tcp        0      0 0.0.0.0:8000            0.0.0.0:*               LISTEN
# Active UNIX domain sockets (only servers)
# Proto RefCnt Flags       Type       State         I-Node Path

# The output shows that our container (172.17.0.2) is receiving a
# connection from 172.17.0.1 when we try to connect to the Python HTTP
# server running on it. The 172.17.0.1 IP address appears to be managed
# by Docker. The container can successfully ping 172.17.0.1.

# If we run ifconfig in a container, we see only one interface "eth0"
# apart from "lo" where "eth0" has an IP address of 172.17.0.2.

set +x
echo
echo Press ENTER to stop the docker container.
read
set -x

docker stop "$(docker ps -q)"
