#!/bin/bash

# Check if check file for crontab already exists
JOB_FILE="/var/local/dns_updater/cronjob_added"
if [ -e "$JOB_FILE" ]; then
    echo "Job already exists, not first run."
    exit 0
fi

if [ -z "$HOURS_DELAY" ]; then
    echo "HOURS_DELAY not set, defaulting to 6 hours."
    HOURS_DELAY="*/6"
elif (( HOURS_DELAY < 24 )) && (( HOURS_DELAY > 0 )); then
    echo "Adding job to run every ${HOURS_DELAY} hours."
    HOURS_DELAY="*/${HOURS_DELAY}"
    echo "job_added" > $JOB_FILE
else
    echo "HOURS_DELAY must be 1-23."
    exit 1
fi

echo -e "0 ${HOURS_DELAY} * * * /bin/update-freedns.sh\n" > /var/spool/cron/crontabs/root
