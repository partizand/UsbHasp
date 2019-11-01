#!/bin/sh

# Bash script for usbhasp start for read config

#PATH=/sbin:/usr/sbin:/usr/local/bin:/bin:/usr/bin
#NAME=usbhaspd

NAME=usbhaspd

DAEMON_BIN=/usr/sbin/usbhasp

DAEMON_CONF=/etc/${NAME}/${NAME}.conf

KEY_DIR=/etc/${NAME}/keys

# read optional conf
if test -f ${DAEMON_CONF} ; then
  
    . ${DAEMON_CONF}

fi

# Read key list
keys=""

if test -d ${KEY_DIR} ; then
   
    for file in ${KEY_DIR}/*.json; do
        keys="${keys} ${file}"
    done 

fi

#DAEMON_ARGS=" -d $keys"

DAEMON_ARGS="$keys"

# Start daemon
$DAEMON_BIN $DAEMON_ARGS

exit 0


