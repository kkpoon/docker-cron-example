#!/bin/sh

touch /var/log/cron.log
touch /etc/cron.d/example-cron
rsyslogd
cron
tail -F /var/log/syslog /var/log/cron.log

