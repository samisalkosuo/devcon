#!/bin/bash

git clone https://github.com/samisalkosuo/certificate-authority.git
cp certificate-authority/certificate/ca.crt /etc/pki/ca-trust/source/anchors/
update-ca-trust extract

cp certificate-authority/create-certificate.sh /usr/local/bin
chmod 755 /usr/local/bin/create-certificate.sh

