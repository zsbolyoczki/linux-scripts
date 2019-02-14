#!/bin/bash

#
# a script that rotates wallpapers from ~/Pictures/wallpapers directory
# requires "hsetroot" to be installed
#

WALLPAPER_DIR="/path/to/wallpapers"

while [ 1 ]; do

  NUMBER_OF_IMAGE_FILES=$(ls -1 ${WALLPAPER_DIR}/ | wc -l)
  PICK_A_RANDOM=$(( ( RANDOM % $NUMBER_OF_IMAGE_FILES )  + 1 ))
  WALLPAPER=$(ls -1 ${WALLPAPER_DIR}/ | tail -n $((NUMBER_OF_IMAGE_FILES - PICK_A_RANDOM)) | head -n1)

  hsetroot -full "${WALLPAPER_DIR}/${WALLPAPER}"  >/dev/null 2>&1 &

  sleep 30

done


