#!/bin/bash

#
# rescans SCSI hosts for new disks
#

for i in `ls -1 /sys/class/scsi_host/`; do echo "- - - " > /sys/class/scsi_host/$i/scan; done
for i in `ls -1 /sys/class/scsi_device/`; do echo "1" > /sys/class/scsi_device/${i}/device/rescan; done

