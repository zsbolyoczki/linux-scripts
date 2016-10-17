#!/bin/bash

#
# converts a decimal to IP Address
#

if [ $1"x" == "x" ]; then
  echo "Usage: $0 decimal"
  exit 1
fi


DEC=$1
O1=$(echo "($DEC / 256^3)" | bc )
O2=$(echo "($DEC - ($O1 * 256^3)) / 256^2" | bc)
O3=$(echo "($DEC - ($O1 * 256^3) - ($O2 * 256^2)) / 256" | bc)
O4=$(echo "($DEC - ($O1 * 256^3) - ($O2 * 256^2) - ($O3 * 256))" | bc)

echo "$O1.$O2.$O3.$O4"

