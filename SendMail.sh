#!/bin/bash

#
# sends high priority emails
# parameters:
#   1: from
#   2: to
#   3: subject
#   4: message
#


LANG=hu_HU.UTF-8
LC_ALL=hu_HU.UTF-8
if [ $# -ne 4 ]; then
  echo "Usage: $0 from to subject message"
  exit 1
fi

echo -e "From:${1}\r\nTo:${2}\r\nSubject:${3}\r\nContent-Type: text/plain; charset=\"utf-8\"\r\nImportance:High\r\nX-Priority: 1\r\n${4}" | /usr/sbin/sendmail -t

