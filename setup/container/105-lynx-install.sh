#lynx command line browser install
#https://learn.hashicorp.com/tutorials/terraform/install-cli

LYNX_VERSION=2.8.9

INSTALL_DIR=lynx-install
mkdir -p $INSTALL_DIR
cdir=$(pwd)
cd $INSTALL_DIR

LYNX_PKG=lynx-${LYNX_VERSION}-2.el8.x86_64.rpm
curl http://rpmfind.net/linux/centos/8-stream/PowerTools/x86_64/os/Packages/${LYNX_PKG} > ${LYNX_PKG}
rpm -ivh ${LYNX_PKG}

#remove install dir
cd $cdir
rm -rf $INSTALL_DIR
