#lynx command line browser install
#https://learn.hashicorp.com/tutorials/terraform/install-cli

W3M_VERSION=0.5.3

INSTALL_DIR=w3m-install
mkdir -p $INSTALL_DIR
cdir=$(pwd)
cd $INSTALL_DIR

PKG=w3m-${W3M_VERSION}-50.git20210102.el8.x86_64.rpm
curl http://rpmfind.net/linux/epel/8/Everything/x86_64/Packages/w/${PKG} > $PKG
rpm -ivh ${PKG}

#remove install dir
cd $cdir
rm -rf $INSTALL_DIR
