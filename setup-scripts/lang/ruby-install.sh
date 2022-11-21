#install ruby from source

#check latest version: https://www.ruby-lang.org/en/downloads/
RUBY_VERSION=3.1.2
RUBY_VERSION_SHORT=3.1

INSTALL_DIR=ruby-install
mkdir -p $INSTALL_DIR
cdir=$(pwd)
cd $INSTALL_DIR

wget https://cache.ruby-lang.org/pub/ruby/${RUBY_VERSION_SHORT}/ruby-${RUBY_VERSION}.tar.gz

tar -xf ruby-${RUBY_VERSION}.tar.gz

cd ruby-$RUBY_VERSION

./configure --prefix=/usr/local
make
make install

#remove install dir
cd $cdir
rm -rf $INSTALL_DIR
