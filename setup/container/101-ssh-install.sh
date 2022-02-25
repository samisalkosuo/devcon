#install SSH server

#dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

#install openssh server in order to generate ssh key
dnf -y install --enablerepo=epel-testing openssh-server

dnf clean all

#generate ssh key 
ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""

#change ssh key hostname to DEVCON_CONTAINER_NAME name
sed -i s/buildkitsandbox/${DEVCON_CONTAINER_NAME}/g /root/.ssh/id_rsa.pub

#set up sshd
ssh-keygen -A && rm -f /run/nologin

#prevent SSH client timeout by sending null packet every 30 seconds
echo "ServerAliveInterval 30" >> /root/.ssh/config

