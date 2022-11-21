#IBM Cloud CLI install 
#see https://cloud.ibm.com/docs/cli

#releases
#https://github.com/IBM-Cloud/ibm-cloud-cli-release/releases/
IBMCLOUD_VERSION=2.11.1

FILENAME=IBM_Cloud_CLI_${IBMCLOUD_VERSION}_amd64.tar.gz

INSTALL_DIR=ibmcloud-install
mkdir -p $INSTALL_DIR
cdir=$(pwd)
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
