cdir=$(pwd)
INSTALL_DIR=${cdir}/misc

mkdir -p $INSTALL_DIR
cd $INSTALL_DIR


#2048 cli
#https://github.com/tiehuis/2048-cli
git clone https://github.com/tiehuis/2048-cli
cd 2048-cli
make
mv 2048 /usr/local/bin/


cd $cdir
rm -rf $INSTALL_DIR