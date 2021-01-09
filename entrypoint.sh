#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

# Setup a cron schedule
echo "* * * * * run-one owncloudcmd -u ${USER} -p ${PASS} --non-interactive /owncloud/data https://${SERVER_URL}:${SERVER_PORT}/remote.php/webdav${SERVER_SUBFOLDER} >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt
cron -f