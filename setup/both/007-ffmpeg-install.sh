#ffmpeg install packages from repository
#see https://computingforgeeks.com/how-to-install-ffmpeg-on-centos-rhel-8/

#set up repos
dnf -y install https://download.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
yum-config-manager --enable powertools

dnf localinstall -y --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
dnf install -y --nogpgcheck https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm

#install ffmepg and development libraries
dnf -y install ffmpeg ffmpeg-devel
