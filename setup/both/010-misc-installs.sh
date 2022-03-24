#misc installs
#not really productive stuff

cdir=$(pwd)
INSTALL_DIR=${cdir}/misc-installs

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
cd $INSTALL_DIR

#rain
#https://github.com/samisalkosuo/ascii-rain
git clone https://github.com/samisalkosuo/ascii-rain.git
cd ascii-rain
gcc rain-no-c-check.c -o /usr/local/bin/rain -lncurses
cd $INSTALL_DIR

#cowsay
dnf -y install cowsay

#fortune
dnf -y install fortune-mod

cd $cdir
rm -rf $INSTALL_DIR