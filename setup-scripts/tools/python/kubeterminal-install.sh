#install KubeTerminal https://github.com/samisalkosuo/kubeterminal

cdir=$(pwd)
INSTALL_DIR=/usr/local/lib
BIN_FILE=/usr/local/bin/kubeterminal
cd $INSTALL_DIR

git clone https://github.com/samisalkosuo/kubeterminal.git

cd $INSTALL_DIR/kubeterminal
#get latest python installed
PYTHON_BIN=$(ls -1 /usr/bin/ |grep ^python |tail -1)

#install requirements
$PYTHON_BIN -m pip  install -r requirements.txt

#create binary file
cat > $BIN_FILE << EOF
cd $INSTALL_DIR/kubeterminal
$PYTHON_BIN kubeterminal.py

EOF

chmod 755 $BIN_FILE

cd $cdir
