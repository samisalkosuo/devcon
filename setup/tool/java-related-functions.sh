function install-java
{
    #install OpenJDK from repository

    local JAVA_VERSION=$1

    sudo dnf -y install ${JAVA_VERSION}-openjdk-devel

    #set installed java as default
    local java_path=$(alternatives --display java |grep $JAVA_VERSION |grep -v "^ " |awk '{print $1}')
    sudo alternatives --set java $java_path

    #To set manually default Java, use:
    #alternatives --config java

}

function install-maven
{
    local MAVEN_VERSION=$1
    local MAVEN_FILE=apache-maven-${MAVEN_VERSION}-bin.tar.gz
    local INSTALL_DIR=python-install
    mkdir -p $INSTALL_DIR
    cdir=$(pwd)
    cd $INSTALL_DIR

    #install maven
    wget https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/${MAVEN_FILE}
    tar -xf ${MAVEN_FILE}
    sudo mv apache-maven-$MAVEN_VERSION /usr/local/bin/
    sudo chown -R root:root /usr/local/bin/apache-maven-$MAVEN_VERSION
    
    #set path
    sudo bash -c "echo \"export PATH=$PATH:/usr/local/bin/apache-maven-$MAVEN_VERSION/bin\" > /etc/profile.d/maven.sh"
    
    #remove install dir
    cd $cdir
    sudo rm -rf $INSTALL_DIR

}

