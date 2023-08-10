#install SSH server

#dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

#install openssh server in order to generate ssh key
dnf -y install --enablerepo=epel-testing openssh-server

#public key already present
cat $DEVCON_USER_HOME/.ssh/id_ed25519.pub >> $DEVCON_USER_HOME/.ssh/authorized_keys

#set up sshd
ssh-keygen -A && rm -f /run/nologin

#workaround for ssh login disconnects after login
#https://discuss.linuxcontainers.org/t/regular-user-is-unable-to-login-via-ssh/4119
sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/' /etc/pam.d/sshd

#prevent SSH client timeout by sending null packet every 30 seconds
echo "ServerAliveInterval 30" >> $DEVCON_USER_HOME/.ssh/config

