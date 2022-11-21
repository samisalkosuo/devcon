

#check latest version from https://go.dev
GO_VERSION=1.19.2


#create install dirextory
INSTALL_DIR=install-directory
mkdir -p $INSTALL_DIR
cdir=$(pwd)
cd $INSTALL_DIR

#do install here
filename=go${GO_VERSION}.linux-amd64.tar.gz
wget https://go.dev/dl/$filename
tar -C /usr/local -xzf $filename

echo "export PATH=/usr/local/go/bin:$PATH"  > /etc/profile.d/go-lang.sh

source /etc/profile.d/go-lang.sh

#remove install dir
cd $cdir
rm -rf $INSTALL_DIR
