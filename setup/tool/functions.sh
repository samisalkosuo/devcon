#functions

function getShortVersion
{
    local version=$1

    read major minor patch < <(echo $version | ( IFS=".$IFS" ; read a b c && echo $a $b $c ))

    # Then you can use them like:
    echo $major.$minor

}

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

function install-cloudpakplugin
{
    local IBMPAKPLUGIN_VERSION=$1

    local FILENAME=cloudctl-linux-amd64.tar.gz

    local INSTALL_DIR=cloudpak-install
    mkdir -p $INSTALL_DIR
    local cdir=$(pwd)
    cd $INSTALL_DIR

    #install cloud pak plugin
    wget https://github.com/IBM/ibm-pak/releases/download/v${IBMPAKPLUGIN_VERSION}/oc-ibm_pak-linux-amd64.tar.gz
    tar -xf oc-ibm_pak-linux-amd64.tar.gz
    sudo mv oc-ibm_pak-linux-amd64 /usr/local/bin/oc-ibm_pak
    sudo chown root:root /usr/local/bin/oc-ibm_pak

    #download IBM cloudctl
    wget https://github.com/IBM/cloud-pak-cli/releases/download/v3.23.5/cloudctl-linux-amd64.tar.gz

    #install ibmcloudctl CLI
    tar -xf cloudctl-linux-amd64.tar.gz
    sudo mv cloudctl-linux-amd64 /usr/local/bin/cloudctl
    sudo chown root:root /usr/local/bin/cloudctl
    
    #remove install dir
    cd $cdir
    sudo rm -rf $INSTALL_DIR   
}

function install-argocd
{
    echo "Installing argocd..."

    curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
    sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
    sudo rm -f argocd-linux-amd64
    echo "Installing argocd...done."
}

function install-ruby
{
    #install ruby from source

    local RUBY_VERSION=$1
    RUBY_VERSION_SHORT=$(getShortVersion $RUBY_VERSION)

    INSTALL_DIR=ruby-install
    mkdir -p $INSTALL_DIR
    cdir=$(pwd)
    cd $INSTALL_DIR

    wget https://cache.ruby-lang.org/pub/ruby/${RUBY_VERSION_SHORT}/ruby-${RUBY_VERSION}.tar.gz

    tar -xf ruby-${RUBY_VERSION}.tar.gz
    rm -f ruby-${RUBY_VERSION}.tar.gz

    cd ruby-$RUBY_VERSION

    ./configure --prefix=/usr/local
    make
    sudo make install

    #remove install dir
    cd $cdir
    rm -rf $INSTALL_DIR

}

function install-mongosh
{
    sudo bash -c 'cat > /etc/yum.repos.d/mongodb-org-7.0.repo  << EOF
[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/7.0/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-7.0.asc
EOF'

    sudo dnf -y install mongodb-mongosh
    
}