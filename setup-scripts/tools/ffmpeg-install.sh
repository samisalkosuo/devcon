#ffmpeg install packages from repository
#see https://computingforgeeks.com/how-to-install-ffmpeg-on-centos-rhel-8/

#check latest version
#https://www.ffmpeg.org/
#but repo might not have them
#check versions in repo using 
#dnf  --showduplicates list ffmpeg
#FFMPEG_VERSION=4.2.8

#set up repos
dnf -y install https://download.fedoraproject.org/pub/epel/epel-release-latest-${releasever}.noarch.rpm
yum-config-manager --enable powertools

dnf localinstall -y --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-${releasever}.noarch.rpm
dnf install -y --nogpgcheck https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-${releasever}.noarch.rpm

#install ffmepg and development libraries
dnf -y install ffmpeg*

#install ffmepg and development libraries
#dnf -y install ffmpeg-$FFMPEG_VERSION ffmpeg-devel-$FFMPEG_VERSION
