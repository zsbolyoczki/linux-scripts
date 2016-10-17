#!/bin/bash

#
# converts an IP to it's decimal representation
#

if [ "${1}""x" == "x" ]; then
  echo "usage: $0 ipaddress"
  exit 1
fi

O1=$(echo $1 | awk -F"." '{print $1}')
O2=$(echo $1 | awk -F"." '{print $2}')
O3=$(echo $1 | awk -F"." '{print $3}')
O4=$(echo $1 | awk -F"." '{print $4}')

echo "$O1*256^3 + $O2 * 256^2 + $O3 * 256 + $O4" | bc

