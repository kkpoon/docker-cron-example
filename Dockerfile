FROM ubuntu

RUN echo Asia/Hong_Kong | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update && apt-get -y install cron rsyslog

ADD crontab /crontab
ADD start-cron.sh /start-cron.sh

RUN crontab /crontab
RUN chmod 755 /start-cron.sh
RUN touch /var/log/cron.log

CMD /start-cron.sh
