#install packages from dnf repository

PACKAGES="""
jq 
nmap 
bash-completion 
httpd-tools 
wget
tcpdump 
dnsmasq 
haproxy 
tmux 
vim 
dnsmasq 
openldap 
openldap-clients 
openldap-devel 
openssl 
openssl-devel 
libffi-devel 
net-tools 
nfs-utils 
bind-utils 
procps-ng 
ntpstat 
chrony 
bind
dhcp-server 
dhcp-client
expect
python3
git
httpd
lighttpd
ansible
ntfs-3g
unzip
skopeo
syslinux
haproxy
yum-utils
createrepo
libmodulemd
modulemd-tools
tree
whois
telnet
ftp
ncftp
ncurses*
xclip
xauth
sqlite-devel
gpm-libs
perl
perl-NKF
nmstate
pip
cmake
"""

dnf -y install epel-release

dnf -y install dnf-plugins-core
dnf -y install 'dnf-command(config-manager)'

#powertools includes for example xorg*
dnf config-manager --set-enabled crb 
#dnf config-manager --set-enabled powertools

dnf -y install --enablerepo=epel-testing $PACKAGES

dnf -y group install "Development Tools"

#moved to rpm-install.sh because sometimes download gets 403 error
#dnf -y install \
#    https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
#    https://dl.fedoraproject.org/pub/epel/epel-next-release-latest-9.noarch.rpm
#dnf -y install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm
#dnf -y install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm

#install packages from repository
#only in container linux

PACKAGES="""
shadow-utils
iproute
redhat-indexhtml
sudo
crun
"""

dnf -y install --enablerepo=epel-testing $PACKAGES


