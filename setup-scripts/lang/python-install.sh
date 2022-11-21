#install python from source

#check latest python: https://www.python.org
PYTHON_VERSION=3.11.0
PYTHON_VERSION_SHORT=3.11

INSTALL_DIR=python-install
mkdir -p $INSTALL_DIR
cdir=$(pwd)
cd $INSTALL_DIR

#remove existing python3 
dnf -y remove python3  || true

wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz

tar -xf Python-$PYTHON_VERSION.tgz

cd Python-$PYTHON_VERSION

#configuration options: https://docs.python.org/3/using/configure.html
./configure --prefix=/usr/local --enable-loadable-sqlite-extensions --enable-optimizations --with-lto --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
make
make install

#remove install dir
cd $cdir
rm -rf $INSTALL_DIR
