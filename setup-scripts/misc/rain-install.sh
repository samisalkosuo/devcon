cdir=$(pwd)
INSTALL_DIR=${cdir}/misc

mkdir -p $INSTALL_DIR
cd $INSTALL_DIR


#rain
#https://github.com/samisalkosuo/ascii-rain
git clone https://github.com/samisalkosuo/ascii-rain.git
cd ascii-rain
gcc rain-no-c-check.c -o /usr/local/bin/rain -lncurses


cd $cdir
rm -rf $INSTALL_DIR