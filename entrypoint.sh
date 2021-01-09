#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

# Run immediately after start
run-one owncloudcmd -u ${USER} -p ${PASS} --non-interactive /owncloud/data https://${SERVER_URL}:${SERVER_PORT}/remote.php/webdav${SERVER_SUBFOLDER} > /proc/self/fd/1 2> /proc/self/fd/2

echo "Scheduling cron"
# Setup a cron schedule

(crontab -l ; echo "${CRON_SCHEDULE:-* * * * *} run-one owncloudcmd -u ${USER} -p ${PASS} --non-interactive /owncloud/data https://${SERVER_URL}:${SERVER_PORT}/remote.php/webdav${SERVER_SUBFOLDER} > /proc/1/fd/1 2>/proc/1/fd/2") | crontab

# schedule it to run periodically
echo "Wait for schedulement"
cron -f