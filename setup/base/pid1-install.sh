#install pid1
#https://github.com/fpco/pid1

#pid1
#Do signal handling and orphan reaping for Unix PID1 init processes.

INSTALL_DIR=pid1-install
mkdir -p $INSTALL_DIR
cdir=$(pwd)
cd $INSTALL_DIR

#check latest version
#https://github.com/fpco/pid1/releases
PID1_VERSION=0.1.3.1
wget https://github.com/fpco/pid1/releases/download/v$PID1_VERSION/pid1

chmod 755 pid1
mv pid1 /sbin/

#remove install dir
cd $cdir
rm -rf $INSTALL_DIR

