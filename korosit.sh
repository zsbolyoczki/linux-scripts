#!/bin/bash

#
# a parameterkent megkapott filenevet alakitja _FILENEV.DATUM_IDO formatumuva
#

if [ "$1""x" == "x" ]; then
  echo "A parameterkent atadott file-t atnevezi _filenev.datum_ido formatumura"
  echo "Usage: $0 /path/to/file"
  exit 1
fi

KONYVTAR=$(dirname "${1}")
FILENEV=$(basename "${1}")
UJNEV=${KONYVTAR}/_${FILENEV}.$(date "+%Y%m%d_%H%M%S")

cp -p "${1}" "${UJNEV}"
touch "${UJNEV}"

