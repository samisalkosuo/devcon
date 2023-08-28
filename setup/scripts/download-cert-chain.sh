#!/bin/bash

#download certificate chain from server

if [[ "$1" == "" ]]; then
    echo "Server not specified."
    echo ""
    echo "Usage: $0 <server:port>"
    exit 1
fi

openssl s_client -showcerts -connect $1 </dev/null | sed -n -e '/-.BEGIN/,/-.END/ p'
