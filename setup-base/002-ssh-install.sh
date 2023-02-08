#install SSH server

#dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

#install openssh server in order to generate ssh key
dnf -y install --enablerepo=epel-testing openssh-server

#generate ssh key RSA
#ssh-keygen -b 4096 -t rsa  -f /root/.ssh/id_rsa -q -N ""
#generate ssh key ed25519
ssh-keygen -t ed25519  -f /root/.ssh/id_ed25519 -q -N ""

cat /root/.ssh/id_ed25519.pub >> /root/.ssh/authorized_keys

#set up sshd
ssh-keygen -A && rm -f /run/nologin

#workaround for ssh login disconnects after login
#https://discuss.linuxcontainers.org/t/regular-user-is-unable-to-login-via-ssh/4119
sed -i ':q
s/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/' /etc/pam.d/sshd

#prevent SSH client timeout by sending null packet every 30 seconds
echo "ServerAliveInterval 30" >> /root/.ssh/config

