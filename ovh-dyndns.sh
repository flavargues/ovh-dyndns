#!/bin/ash
set -e

getip ()
{
    IP=$(curl --silent -$IP_VERSION $IP_CHECKER)
    OLD_IP=$(dig +short $DOMAIN_NAME $NS_SERVER | head -1)
}

getip
if [ $IP != $OLD_IP ]; then
    RESPONSE_BODY=$(curl --silent --user "$DYNHOST_ID:$DYNHOST_PASSWORD" "https://www.ovh.com/nic/update?system=dyndns&hostname=$DOMAIN_NAME&myip=$IP")
    FEEDBACK="[`date '+%Y-%m-%d %H:%M:%S'`] CHG      $OLD_IP => $IP     \"$RESPONSE_BODY\""
else
    FEEDBACK="[`date '+%Y-%m-%d %H:%M:%S'`] NO CHG"
fi
    echo $FEEDBACK
    echo $FEEDBACK >> $LOG_LOCATION
    echo $FEEDBACK >> STDOUT