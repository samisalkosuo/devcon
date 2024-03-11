#!/bin/bash

#view certficate from server

if [[ "$1" == "" ]]; then
    echo "Server not specified."
    echo ""
    echo "Usage: $0 <server:port>"
    exit 1
fi

echo | openssl s_client -connect $1 2>/dev/null | openssl x509 -text -noout
#echo | openssl s_client -servername $1 -connect $1 2>/dev/null | openssl x509 -text -noout
#openssl s_client -showcerts -servername $1 -connect $1 </dev/null

