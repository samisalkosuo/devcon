#!/bin/bash

git clone https://github.com/samisalkosuo/certificate-authority.git
cp certificate-authority/certificate/ca.crt /etc/pki/ca-trust/source/anchors/
update-ca-trust extract

#create certificate
cd certificate-authority
sh create-certificate.sh -c "DevCon WeTTY" -I "127.0.0.1" wetty localhost devcon
cd ..
