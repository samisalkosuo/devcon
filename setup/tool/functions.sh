#functions


function install-ibmcloud-cli
{
    local IBMCLOUD_VERSION=$1

    local FILENAME=IBM_Cloud_CLI_${IBMCLOUD_VERSION}_amd64.tar.gz

    local INSTALL_DIR=ibmcloud-install
    mkdir -p $INSTALL_DIR
    local cdir=$(pwd)
    cd $INSTALL_DIR

    #download ibmcloud CLI
    curl https://download.clis.cloud.ibm.com/ibm-cloud-cli/${IBMCLOUD_VERSION}/${FILENAME} > ${FILENAME}

    #install ibmcloud CLI
    tar -xf ${FILENAME}
    cd Bluemix_CLI/
    sudo ./install

    #install all ibmcloud CLI plugins
    ibmcloud plugin install --all

    #remove install dir
    cd $cdir
    rm -rf $INSTALL_DIR

}

function downloadOpenShiftClient
{
    local __file=$1
    echo "Downloading ${__file}..."
    local __dlurl=https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OPENSHIFT_CLIENT_VERSION
    curl $__dlurl/${__file} > ${__file}

    echo "Extracting ${__file} to /usr/local/bin/..."
    sudo tar  -C /usr/local/bin/ -xf ${__file}
    rm -f  ${__file}
    echo "Downloading ${__file}...done."
}

function install-python
{
    #install python from source

    local PYTHON_VERSION=$1

    local INSTALL_DIR=python-install
    mkdir -p $INSTALL_DIR
    cdir=$(pwd)
    cd $INSTALL_DIR

    #remove existing python3 
    #dnf -y remove python3  || true

    wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz

    tar -xf Python-$PYTHON_VERSION.tgz

    cd Python-$PYTHON_VERSION

    #configuration options: https://docs.python.org/3/using/configure.html
    sudo ./configure --prefix=/usr/local --enable-loadable-sqlite-extensions --enable-optimizations --with-lto --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
    sudo make
    sudo make install

    #remove install dir
    cd $cdir
    sudo rm -rf $INSTALL_DIR

}

