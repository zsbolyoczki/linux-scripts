#!/bin/bash

#
# rescans SCSI hosts for new disks
#

for f in $(find /sys/class/scsi_host/host* -maxdepth 1); do echo "- - - " > $f/scan; done
