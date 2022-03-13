FROM docker.io/library/rockylinux:8.5

#name of the container should be the name of the container host 
#use '-h devcon' option , when starting the container (do not use -e option)
ENV DEVCON_CONTAINER_NAME=devcon

#setup script directory
WORKDIR /root/setup

#====SETUP SECTION START
#setup the container, step by step in order to use build caches
#when adding new packages, software, etc, include them inside SETUP SECTION

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

#lynx
COPY setup/container/105-lynx-install.sh .
RUN sh -e 105-lynx-install.sh

#w3m
COPY setup/container/106-w3m-install.sh .
RUN sh -e 106-w3m-install.sh

#python
COPY setup/both/002-python-install.sh .
RUN sh -e 002-python-install.sh

#nodejs
COPY setup/both/003-nodejs-install.sh .
RUN sh -e 003-nodejs-install.sh

#dumb-init
COPY setup/container/103-dumbinit-install.sh .
RUN sh -e 103-dumbinit-install.sh

#wetty
COPY setup/container/104-wetty-install.sh .
RUN sh -e 104-wetty-install.sh

#terraform
COPY setup/both/004-terraform-install.sh .
RUN sh -e 004-terraform-install.sh

#openshift client install
COPY setup/both/0100-openshift-client-install.sh .
RUN sh -e 0100-openshift-client-install.sh

#ruby install
COPY setup/both/005-ruby-install.sh .
RUN sh -e 005-ruby-install.sh

#asciidoctor install
COPY setup/both/006-asciidoctor-install.sh .
RUN sh -e 006-asciidoctor-install.sh

#ffmpeg install
COPY setup/both/007-ffmpeg-install.sh .
RUN sh -e 007-ffmpeg-install.sh

#ibmcloud install
COPY setup/both/008-ibmcloud-install.sh .
RUN sh -e 008-ibmcloud-install.sh


#environment variables
COPY setup/environment.sh .

#====SETUP SECTION END

#working directory
WORKDIR /root

#create directories
RUN mkdir -p /root/host && \
    mkdir -p /root/tmp && \
    mkdir -p /root/bin

#====ENVIRONMENT VARIABLES SECTION START
#set runtime environment variables
#set variables in devcon-shell.sh to .bash_profile 
#so that they are available in ssh sessions

#DISPLAY env for Windows
#use -e DISPLAY to set another DISPLAY
#X-server is needed for Windows: https://sourceforge.net/projects/vcxsrv/ 
#and start 'XLaunch' before starting this container
ENV DISPLAY=host.docker.internal:0
#DISPLAY env in Mac
#X-server is needed for Mac: https://www.xquartz.org/
#and start 'XQuartz' before starting this container
#ENV DISPLAY=docker.for.mac.host.internal:0
#DISPLAY env in Linux, use "--net host" when starting the container
#ENV DISPLAY=:0

#wetty port within container
ENV WETTY_PORT=3000

#====ENVIRONMENT VARIABLES SECTION END


#exposed ports
EXPOSE 22 $WETTY_PORT

#map this volume to host directory where you want your persistent data
VOLUME ["/root/host"]

COPY devcon-shell.sh .
CMD ["sh","/root/devcon-shell.sh"]
