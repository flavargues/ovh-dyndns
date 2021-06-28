#!/bin/sh
PUBLIC_IP=$(curl --silent -$IPVERSION $NSSERVER)

curl -v --silent --user "$DYNHOST_ID:$DYNHOST_PASSWORD" "https://www.ovh.com/nic/update?system=dyndns&hostname=$DOMAIN_NAME&myip=$PUBLIC_IP"