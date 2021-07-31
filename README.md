# ovh-dyndns

Checks every 5 minutes if the public IP WAN-side is different from the current public IP, and if so refresh the DNS record through the OVH API. 

## Docker-compose
```
version: "3"
services:
    ovh-dyndns:
        restart: always
        image: flavargues/ovh-dyndns
        #for arm64 platform
        #image: flavargues/ovh-dyndns:arm64
        environment:
            DOMAIN_NAME: 
            #Generate your Dynhost ID on the OVH administration panel
            DYNHOST_ID: 
            DYNHOST_PASSWORD: 
```
## Other costumization
```
            #Version 6 not yet supported
            ENV IP_VERSION='4'
            #Website to get current public IP
            ENV IP_CHECKER=http://ifconfig.me/ip
            #Server to check current DNS record
            ENV NS_SERVER='one.one.one.one'
            #logfile location
            ENV LOG_LOCATION='/var/ip.history'
```
