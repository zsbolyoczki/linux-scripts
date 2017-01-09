#!/bin/bash


#
# example script for custom ssh prtg sensors
#


# return codes:
# 0 OK
# 1 WARNING --> yellow
# 2 System Error (e.g. a network/socket error) --> yellow
# 3 Protocol Error (e.g. web server returns a 404) --> red
# 4 Content Error (e.g. a web page does not contain a required word) --> yellow

if [ $(netstat -tulpan | egrep ":22.*LISTEN.*sshd") -gt 0 ]; then
  echo "0:0:SSH is running"
else
  echo "1:1:SSH is down"
fi

