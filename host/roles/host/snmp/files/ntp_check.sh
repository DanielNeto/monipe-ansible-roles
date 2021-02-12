#!/bin/bash
#Script para buscar estado do NTP

RET=`docker ps | grep ps-testpoint | wc -l`

DOCKERCALL=""

if [ "$RET" == "1" ]; then
    DOCKERCALL="docker exec ps-testpoint"
fi

RETORNO=`$DOCKERCALL ntpq -pn | /bin/egrep "^\*|^o"`

if [ "$RETORNO" == "" ]
then
        echo "WARNING: NOT SYNC"
        exit 0
else
        echo "OK: $RETORNO"
        exit 1
fi