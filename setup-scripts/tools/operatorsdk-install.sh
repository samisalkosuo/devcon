
OPERATORSDK_VERSION=1.25.0

#create install dirextory
INSTALL_DIR=install-directory
mkdir -p $INSTALL_DIR
cdir=$(pwd)
cd $INSTALL_DIR

#do install here
ARCH=$(case $(uname -m) in x86_64) echo -n amd64 ;; aarch64) echo -n arm64 ;; *) echo -n $(uname -m) ;; esac)
OS=$(uname | awk '{print tolower($0)}')

OPERATOR_SDK_DL_URL=https://github.com/operator-framework/operator-sdk/releases/download/v$OPERATORSDK_VERSION
curl -LO ${OPERATOR_SDK_DL_URL}/operator-sdk_${OS}_${ARCH}

chmod +x operator-sdk_${OS}_${ARCH} && sudo mv operator-sdk_${OS}_${ARCH} /usr/local/bin/operator-sdk

#remove install dir
cd $cdir
rm -rf $INSTALL_DIR
