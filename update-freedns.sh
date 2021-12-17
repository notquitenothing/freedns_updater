#!/bin/bash

TOKEN_FILE="/var/local/dns_updater/key"

if [ -e "$TOKEN_FILE" ]; then
    TOKENS=`cat $TOKEN_FILE`
elif [ ! -z "$TOKENS" ]; then
    echo "Adding TOKENS to token file, first run."
    echo "$TOKENS" > $TOKEN_FILE
else
    echo "TOKENS must be set on first start."
    exit 1
fi

readarray -d ";" -t tokenarr <<< "${TOKENS}"
for token in ${tokenarr[@]}
do
  echo -n "`date` : " && curl -s "https://sync.afraid.org/u/${token}/"
done
