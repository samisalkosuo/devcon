#devcon base image
#packages from dnf repository, podman, tmux and other packages for base 
FROM library/rockylinux:8.5


#setup script directory
WORKDIR /root/setup

#packages from repository
COPY setup/both/000-dnf-install.sh .
RUN sh -e 000-dnf-install.sh

#dnf packages only for container
COPY setup/container/100-dnf-install.sh .
RUN sh -e 100-dnf-install.sh

#ssh server install and config
COPY setup/container/101-ssh-install.sh .
RUN sh -e 101-ssh-install.sh

#podman for container
COPY setup/container/102-podman-install.sh .
COPY setup/container/containers.conf .
COPY setup/container/podman-containers.conf .
ENV _CONTAINERS_USERNS_CONFIGURED=""
ENV NETFILTER_XT_MATCH_COMMENT=0
RUN sh -e 102-podman-install.sh

#tmux install and config
COPY setup/both/001-tmux.conf-install.sh .
COPY setup/both/.tmux.conf.local .
RUN sh -e 001-tmux.conf-install.sh

