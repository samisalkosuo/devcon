function install-kubeterminal
{
  #install KubeTerminal https://github.com/samisalkosuo/kubeterminal

  local cdir=$(pwd)
  local INSTALL_DIR=/usr/local/lib
  local BIN_FILE=/usr/local/bin/kubeterminal
  cd $INSTALL_DIR

  sudo git clone https://github.com/samisalkosuo/kubeterminal.git

  cd $INSTALL_DIR/kubeterminal
  sudo chown -R $DEVCON_USER:$DEVCON_USER .
  #get latest python installed
  local PYTHON_BIN=$(ls -1 /usr/bin/ |grep ^python |tail -1)

  #install requirements
  $PYTHON_BIN -m pip  install -r requirements.txt

  #create binary file
  sudo bash -c "cat > $BIN_FILE << EOF
cd $INSTALL_DIR/kubeterminal
$PYTHON_BIN kubeterminal.py

EOF"

  sudo chmod 755 $BIN_FILE

  sudo chown -R root:root .

  cd $cdir

}