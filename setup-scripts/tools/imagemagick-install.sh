#ImageMagick
#see https://imagemagick.org/

IMAGEMAGICK_VERSION=7.1.0

#check file name from web
#https://imagemagick.org/script/download.php#linux
RPM_FILE=ImageMagick-7.1.0-51.x86_64.rpm
RPM_LIB_FILE=ImageMagick-libs-7.1.0-51.x86_64.rpm

INSTALL_DIR=imagemagick-install
mkdir -p $INSTALL_DIR
cdir=$(pwd)
cd $INSTALL_DIR

wget https://imagemagick.org/archive/linux/CentOS/x86_64/$RPM_FILE
wget https://imagemagick.org/archive/linux/CentOS/x86_64/$RPM_LIB_FILE


#install dependencies
dnf -y install libHalf* libIlm* libraq* libraw* libwmflite*  libraw_r* 
dnf -y install libheif*

#install ImageMagick
rpm -Uvh $RPM_LIB_FILE
rpm -Uvh $RPM_FILE

#remove install dir
cd $cdir
rm -rf $INSTALL_DIR
