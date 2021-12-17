FROM alpine:latest

RUN apk add --no-cache curl bash

# Add the scripts
COPY update-freedns.sh replace-crontab.sh /bin/

# Make the scripts runnable
RUN chmod +x /bin/update-freedns.sh && \
    chmod +x /bin/replace-crontab.sh

# Make the key file directory
RUN mkdir /var/local/dns_updater

# First run the dns_update script and set cron running
CMD /bin/replace-crontab.sh && /bin/update-freedns.sh && crond -d 6 -f