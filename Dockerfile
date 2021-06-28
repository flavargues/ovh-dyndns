FROM alpine

ENV IPVERSION=4
ENV NSSERVER=http://icanhazip.com/
ENV DOMAIN_NAME=''
ENV DYNHOST_ID=''
ENV DYNHOST_PASSWORD=''

COPY ovh-dyndns.sh /bin/ovh-dyndns.sh
COPY root /var/spool/cron/crontabs/root

RUN chmod +x /bin/ovh-dyndns.sh && apk add curl

CMD crond -l 2 -f