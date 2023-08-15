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
    ./install

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
    tar  -C /usr/local/bin/ -xf ${__file}
    rm -f  ${__file}
    echo "Downloading ${__file}...done."
}
