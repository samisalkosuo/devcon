#install packages from repository
#only in non-container linux

#most packages are already installed
#podman is installed differently in container

PACKAGES="""
podman
container*
"""

dnf -y install --enablerepo=epel-testing $PACKAGES

dnf clean all
