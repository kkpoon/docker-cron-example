FROM ubuntu:trusty

RUN echo Asia/Hong_Kong | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update && apt-get -y install cron rsyslog

ADD crontab /etc/cron.d/example-cron
ADD start-cron.sh /start-cron.sh

RUN chmod 755 /start-cron.sh
RUN chmod 0644 /etc/cron.d/example-cron
RUN touch /var/log/cron.log

CMD /start-cron.sh
