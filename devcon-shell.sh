#script to execute when devcon-container is started

source ~/.bash_profile

#create required config directories 
mkdir -p /root/host/config/tmux/

#set environment variables in .bash_profile when starting the container
#so they are accessible when using ssh to connect to container
echo "export DISPLAY=${DISPLAY}" >> ~/.bash_profile
echo "export WETTY_PORT=${WETTY_PORT}" >> ~/.bash_profile
#read variables from environment.sh and add them to .bash_profile
cat setup/environment.sh | grep -v "^#" >> ~/.bash_profile

#set root password
__rootpassword=$(date +%s | sha256sum | base64 | head -c 15)
if [[ -v ROOT_PASSWORD ]]; then
  #use env variable ROOT_PASSWORD as password
  __rootpassword=$ROOT_PASSWORD
fi 
#change root password
echo "root:$__rootpassword" | chpasswd

#start SSH daemon if not disabled
__sshd_status=""
if [[ -v DISABLE_SSHD ]]; then
  #DISABLE_SSHD exists, do not start sshd
  __sshd_status="disabled"
else 
  /usr/sbin/sshd
  __sshd_status="enabled (root pwd: $__rootpassword)"
fi

__now=$(date)
__hostname=$(hostname)
if [[ ! "$__hostname" == "${DEVCON_CONTAINER_NAME}" ]]; then
  __hostname="$__hostname (WARNING: host name should be '${DEVCON_CONTAINER_NAME}')"
fi

__startupInfoFile=startup-info.txt
#write startup info file
__release=$(cat /etc/rocky-release)
echo "Welcome, friend!" > $__startupInfoFile
echo "" >> $__startupInfoFile
echo "Started     : $__now" >> $__startupInfoFile
echo "OS release  : $__release"  >> $__startupInfoFile
echo "Host name   : $__hostname" >> $__startupInfoFile
echo "SSHD        : $__sshd_status" >> $__startupInfoFile
echo "Version info:" >> $__startupInfoFile
cat setup/*sh | \
    grep "_VERSION=" | \
    sed "s/_VERSION=/,/g" | \
    sort | \
    column  -s ',' -t | \
    awk '{print "              " $0}' >> $__startupInfoFile


#add startup txt to .bash_profile to be shown whenever logged in
echo "cat $__startupInfoFile" >> .bash_profile

__exec=shell

if [[ -v WETTY_HTTP ]]; then
   __exec=wetty_http
fi

if [[ -v WETTY_HTTPS ]]; then
   __exec=wetty_https
fi

case "$__exec" in
    shell)
        exec /bin/bash -l
        ;;        
    wetty_http)
        #run with http
        dumb-init wetty --host 0.0.0.0 --port $WETTY_PORT --title WeTTY --base /
        ;;
    wetty_https)
        #run with https
        dumb-init wetty --host 0.0.0.0 --port $WETTY_PORT --title WeTTY --base / --ssl-key ~/.ssl/wetty.key --ssl-cert ~/.ssl/wetty.crt
        ;;
    *)
        echo "no exec"
        exit 1
        ;;
esac
