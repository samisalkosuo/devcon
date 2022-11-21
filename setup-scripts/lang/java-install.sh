#install OpenJDK from repository

#check available by listing what are possible to install
#dnf install java-*devel

#JAVA_VERSION=java-1.8.0
#JAVA_VERSION=java-11
JAVA_VERSION=java-17

dnf -y install ${JAVA_VERSION}-openjdk-devel

#set installed java as default
java_path=$(alternatives --display java |grep $JAVA_VERSION |grep -v "^ " |awk '{print $1}')
alternatives --set java $java_path

#To set manually default Java, use:
#alternatives --config java
