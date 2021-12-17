#!/bin/bash

KEY_FILE="/var/local/dns_updater/key"

if [ -e "$KEY_FILE" ]; then
    KEYS=`cat $KEY_FILE`
elif [ ! -z "$KEYS" ]; then
    echo "Adding keys to key file, first run."
    echo "$KEYS" > $KEY_FILE
else
    echo "KEYS must be set on first start."
    exit 1
fi

readarray -d ";" -t keyarr <<< "${KEYS}"
for key in ${keyarr[@]}
do
  echo -n "`date` : " && curl -s "https://sync.afraid.org/u/${key}/"
done
