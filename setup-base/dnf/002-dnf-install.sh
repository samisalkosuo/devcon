#install packages from repository
#only in container linux


PACKAGES="""
shadow-utils
iproute
redhat-indexhtml
sudo
crun
"""

dnf -y install --enablerepo=epel-testing $PACKAGES

