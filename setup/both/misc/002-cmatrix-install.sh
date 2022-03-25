cdir=$(pwd)
INSTALL_DIR=${cdir}/cmatrix

mkdir -p $INSTALL_DIR
cd $INSTALL_DIR


#cmatrix
#https://github.com/abishekvashok/cmatrix
git clone https://github.com/abishekvashok/cmatrix.git
cd cmatrix
autoreconf -i  # skip if using released tarball
./configure
make
make install


cd $cdir
rm -rf $INSTALL_DIR