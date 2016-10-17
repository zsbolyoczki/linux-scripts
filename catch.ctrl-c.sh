#!/bin/bash

#
# this script 
# 	creates a file
# 	waits for ctrl-c
# 	removes the file when ctrl-c is caught
#


TEMP_FILE="/tmp/ctrlc.tmp"


trap ctrl_c INT

function ctrl_c() {

	rm -f ${TEMP_FILE} >/dev/null 2>&1
	echo 
  echo "Nice exit. Removing ${TEMP_FILE}"
	echo
  exit 1
}


echo "Creating ${TEMP_FILE}"
touch ${TEMP_FILE}

while [ 1 ]; do

	read -p "Press enter or CTRL-C! "

done


