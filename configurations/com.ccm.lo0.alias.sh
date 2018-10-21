#!/bin/sh

# These were extracted from:
# https://github.com/riptano/ccm/blob/master/NETWORK_ALIASES.md

sudo /sbin/ifconfig lo0 alias 127.0.0.2;
sudo /sbin/ifconfig lo0 alias 127.0.0.3;
