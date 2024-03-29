#entertaining software

function install-rain
{
    local cdir=$(pwd)
    local INSTALL_DIR=${cdir}/misc

    mkdir -p $INSTALL_DIR
    cd $INSTALL_DIR

    #rain
    #https://github.com/samisalkosuo/ascii-rain
    git clone https://github.com/samisalkosuo/ascii-rain.git
    cd ascii-rain
    sudo gcc rain-no-c-check.c -o /usr/local/bin/rain -lncurses

    cd $cdir
    sudo rm -rf $INSTALL_DIR
}

function install-cmatrix
{
    local cdir=$(pwd)
    local INSTALL_DIR=${cdir}/cmatrix

    mkdir -p $INSTALL_DIR
    cd $INSTALL_DIR

    #cmatrix
    #https://github.com/abishekvashok/cmatrix
    git clone https://github.com/abishekvashok/cmatrix.git
    cd cmatrix
    mkdir -p build
    cd build
    # to install to "/usr/local"
    cmake ..
    make
    sudo make install

    cd $cdir
    sudo rm -rf $INSTALL_DIR
}

function install-2048
{
    local cdir=$(pwd)
    local INSTALL_DIR=${cdir}/misc

    mkdir -p $INSTALL_DIR
    cd $INSTALL_DIR


    #2048 cli
    #https://github.com/tiehuis/2048-cli
    git clone https://github.com/tiehuis/2048-cli
    cd 2048-cli
    make
    sudo mv 2048 /usr/local/bin/


    cd $cdir
    sudo rm -rf $INSTALL_DIR
}