#!/usr/bin/env python3

# This is just a simple script that loops infinitely and writes logs.
# We turn this program into a service with System V or systemd.
import sys
import time
import os.path

def log(s):
    name = os.path.basename(sys.argv[0])
    with open('/var/log/foo/foo.log', 'a') as f:
        print(time.strftime('%Y-%m-%d %H:%M:%S'), name, s, file=f)

if __name__ == '__main__':
    log('starting ...')
    while True:
        log('working ...')
        time.sleep(1)
    log('stopping ...')
