FROM alpine
RUN apk update
RUN apk add python3
EXPOSE 8000 9000

# CMD python3 -m http.server

# The above way of invoking python3 leads to invocation of a shell that
# in turn runs python3. This has the disadvantage that the container
# must be run with the -it option to ensure that the shell can output to
# a terminal and accept keyboard interrupt (Ctrl+C) from the terminal.

# CONTAINER ID        IMAGE                COMMAND                  CREATED             STATUS              PORTS                NAMES
# 3e18bb59d23a        expose-python-http   "/bin/sh -c 'python3…"   6 seconds ago       Up 6 seconds        8000/tcp, 9000/tcp   stoic_bhaskara

# TODO: Although with the following invocation we can kill the container
# by pressing Ctrl+C, the output from http.server does not appear on the
# terminal until just before the container quits on pressing Ctrl+C.

# The following way of invoking python3 does not invoke a shell.
CMD ["python3", "-m", "http.server"]
