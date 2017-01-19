#!/bin/bash

#
# extracts validity info from a site's certificate
#


if [ "${1}x" == "x" ]; then

	echo "Usage: $0 hostname:port"
	exit 1

fi

which openssl >/dev/null 2>&1
if [ "${?}" -ne 0 ]; then
	echo "openssl is not installed"
	exit 1
fi


URL="${1}"

openssl s_client -showcerts -connect "${URL}" </dev/null > ./certificates.txt 2>/dev/null

CERT_COUNTER=0
FLAG=0
CERT_FILE=""

while read s; do

	if [ "${s}" == "-----BEGIN CERTIFICATE-----" ]; then

		FLAG=1
		CERT_COUNTER=$((CERT_COUNTER + 1))	
		CERT_FILE="./cert.${CERT_COUNTER}.txt"

	fi


	if [ "${FLAG}" == 1 ]; then

		echo "${s}" >> "${CERT_FILE}"

	fi

	if [ "${s}" == "-----END CERTIFICATE-----" ]; then

		FLAG=0
		CERT_FILE="./cert.${CERT_COUNTER}.txt"
		echo "${s}" >> "${CERT_FILE}"

	fi


done < ./certificates.txt

for f in $(find . -maxdepth 1 -type f -name "cert.*.txt"); do

	echo "==================================================================="
	openssl.exe x509 -noout -text -in "${f}" | grep -E "Subject: |Not " | sort -r | sed 's/  //g'
	echo "==================================================================="

done


rm -f ./certificates.txt >/dev/null 2>&1
rm -f cert.*.txt >/dev/null 2>&1

