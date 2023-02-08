#install openshift clients

#check latest versions
#https://mirror.openshift.com/pub/openshift-v4/clients/ocp/
OPENSHIFT_CLIENT_VERSION=4.12.0


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

downloadOpenShiftClient openshift-client-linux.tar.gz

downloadOpenShiftClient openshift-install-linux.tar.gz

downloadOpenShiftClient opm-linux.tar.gz

downloadOpenShiftClient oc-mirror.tar.gz
