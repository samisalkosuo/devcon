#install python from source

#check latest python: https://www.python.org
PYTHON_VERSION=3.10.3
PYTHON_VERSION_SHORT=3.10

INSTALL_DIR=python-install
mkdir -p $INSTALL_DIR
cdir=$(pwd)
cd $INSTALL_DIR

#set alias
echo "alias python=python${PYTHON_VERSION_SHORT}" >> ~/.bash_profile
echo "alias pip='python${PYTHON_VERSION_SHORT} -m pip'" >> ~/.bash_profile

wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz

tar -xf Python-$PYTHON_VERSION.tgz

cd Python-$PYTHON_VERSION

#configuration options: https://docs.python.org/3/using/configure.html
./configure --enable-loadable-sqlite-extensions --enable-optimizations --with-lto
make
make altinstall

#remove install dir
cd $cdir
rm -rf $INSTALL_DIR
