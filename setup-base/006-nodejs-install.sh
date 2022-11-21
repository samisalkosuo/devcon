#install nodejs from binary package
#https://github.com/nodejs/help/wiki/Installation

#check latest nodejs: https://nodejs.org

NODEJS_VERSION=18.4.0
NODEJS_FILE=node-v${NODEJS_VERSION}-linux-x64.tar.xz
NODEJS_DIR=/usr/local/lib/nodejs

#source environment variables
source /etc/profile.d/devcon.sh

INSTALL_DIR=nodejs-install
mkdir -p $INSTALL_DIR
cdir=$(pwd)
cd $INSTALL_DIR

wget https://nodejs.org/dist/v${NODEJS_VERSION}/$NODEJS_FILE

mkdir -p ${NODEJS_DIR}
tar -xJvf $NODEJS_FILE -C ${NODEJS_DIR}

#set path
echo "export PATH=${NODEJS_DIR}/node-v${NODEJS_VERSION}-linux-x64/bin:\$PATH" > /etc/profile.d/nodejs.sh

#remove install dir
cd $cdir
rm -rf $INSTALL_DIR
