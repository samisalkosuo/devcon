#install packages from repository
#only in container linux


PACKAGES="""
iproute
redhat-indexhtml
sudo

"""

dnf -y install --enablerepo=epel-testing $PACKAGES

dnf clean all
