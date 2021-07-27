#!/bin/sh
set -e

getip ()
{
    IP=$(curl --silent -$IP_VERSION $IP_CHECKER)
    OLD_IP=$(dig +short $DOMAIN_NAME $NS_SERVER | head -1)
}

getip
if [ $IP != $OLD_IP ]; then
    RESPONSE_BODY=$(curl --silent --user "$DYNHOST_ID:$DYNHOST_PASSWORD" "https://www.ovh.com/nic/update?system=dyndns&hostname=$DOMAIN_NAME&myip=$IP")
    echo "[`date '+%Y-%m-%d %H:%M:%S'`] CHG      $OLD_IP => $IP     \"$RESPONSE_BODY\""
    echo "[`date '+%Y-%m-%d %H:%M:%S'`] CHG      $OLD_IP => $IP     \"$RESPONSE_BODY\"" >> $LOG_LOCATION
else
    echo "[`date '+%Y-%m-%d %H:%M:%S'`] NO CHG"
fi
