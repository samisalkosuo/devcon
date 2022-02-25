#install packages from dnf repository

PACKAGES="""
jq 
nmap 
bash-completion 
httpd-tools 
curl 
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
xorg-x11-apps
sqlite-devel
gpm-libs
perl
perl-NKF
"""

dnf -y install epel-release

dnf -y install dnf-plugins-core
dnf -y install 'dnf-command(config-manager)'

#powertools includes for example xorg*
dnf config-manager --set-enabled powertools

dnf -y install --enablerepo=epel-testing $PACKAGES

dnf -y group install "Development Tools"

dnf clean all
