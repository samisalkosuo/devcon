#install KubeTerminal https://github.com/samisalkosuo/kubeterminal

cdir=$(pwd)
INSTALL_DIR=/usr/local/lib
BIN_FILE=/usr/local/bin/kubeterminal
cd $INSTALL_DIR

git clone https://github.com/samisalkosuo/kubeterminal.git

cat > $BIN_FILE << EOF
cd $INSTALL_DIR/kubeterminal
python kubeterminal.py

EOF

chmod 755 $BIN_FILE

cd $cdir
