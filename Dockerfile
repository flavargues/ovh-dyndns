FROM alpine

ENV IP_VERSION='4'
ENV IP_CHECKER=http://ifconfig.me/ip
ENV LOG_LOCATION='/var/ip.history'

ENV DOMAIN_NAME=''
ENV DYNHOST_ID=''
ENV DYNHOST_PASSWORD=''

COPY ovh-dyndns.sh /bin/ovh-dyndns.sh
COPY root /var/spool/cron/crontabs/root

RUN chmod +x /bin/ovh-dyndns.sh && apk add curl && apk add bind-tools

CMD crond -l 2 -f