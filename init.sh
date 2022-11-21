#!/bin/bash

echo "Initializing container..."
#set root password
__rootpassword=$(date +%s | sha256sum | base64 | head -c 15)
if [[ -v ROOT_PASSWORD ]]; then
  #use env variable ROOT_PASSWORD as password
  __rootpassword=$ROOT_PASSWORD
fi 
#change root password
echo "root:$__rootpassword" | chpasswd
echo "root:$__rootpassword" > /root/passwords.txt

#set devcon-user password
__devconpassword=$(date +%s | sha256sum |head -c 15 | sha256sum| base64 | head -c 15)
if [[ -v DEVCON_USER_PASSWORD ]]; then
  __devconpassword=$DEVCON_USER_PASSWORD
fi 
#set devcon user password
echo "$DEVCON_USER_NAME:$__devconpassword" | chpasswd
echo "$DEVCON_USER_NAME:$__devconpassword" >> /root/passwords.txt

#set release version
source /etc/os-release
echo "export releasever=$REDHAT_SUPPORT_PRODUCT_VERSION" >>  /etc/profile.d/devcon.sh


#set supported environment variables
if [[ -v DISPLAY ]]; then
  echo "export DISPLAY=$DISPLAY" >>  /etc/profile.d/devcon.sh
fi 


echo "Initializing container...done."

echo "Starting systemd..."
exec /sbin/init