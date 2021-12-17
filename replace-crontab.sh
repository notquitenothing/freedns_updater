#!/bin/bash

if [ -z "$HOURS_DELAY" ]; then
    echo "HOURS_DELAY not set, defaulting to 6 hours."
    HOURS_DELAY="*/6"
else
    echo "Adding job to run every ${HOURS_DELAY} hours."
    HOURS_DELAY="*/${HOURS_DELAY}"
fi

rm /var/spool/cron/crontabs/root
echo -e "0 ${HOURS_DELAY} * * * /bin/update-freedns.sh\n" >> /var/spool/cron/crontabs/root