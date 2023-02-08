#Rocky Linux with systemd
#execute using:
#  docker run -it --rm --name devconsystemd --privileged -p 2222:22 -v /sys/fs/cgroup:/sys/fs/cgroup:ro devconsystemd
#make sure to add required flags: --privileged and -v /sys/fs/cgroup:/sys/fs/cgroup:ro
FROM docker.io/rockylinux/rockylinux:8.7

#---setup systemd 
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
#---setup systemd 
ENV DEVCON_SETUP_DIRECTORY=/root/setup-scripts

#install base packages early in the build process
WORKDIR ${DEVCON_SETUP_DIRECTORY}/base
COPY setup-base/dnf/ ./
#install 
RUN sh -e 001-dnf-install.sh
RUN sh -e 002-dnf-install.sh

WORKDIR ${DEVCON_SETUP_DIRECTORY}/base

#add environment
COPY setup-config/environment.sh /etc/profile.d/devcon.sh
#add and install base services
COPY setup-base/ ./
RUN sh -e 002-create-xdg-dirs.sh
RUN sh -e 002-ssh-install.sh
RUN sh -e 003-podman-install.sh
RUN sh -e 004-tmux.conf-install.sh
RUN sh -e 006-nodejs-install.sh
RUN sh -e 007-wetty-install.sh

#add setup scripts
COPY setup-scripts/ ../

#add configurations
COPY setup-config/configurations.sh ./
RUN sh -e configurations.sh

#working directory
WORKDIR /root

#create directories
RUN mkdir -p /root/host && \
    mkdir -p /root/tmp && \
    mkdir -p /root/bin

#exposed ports
EXPOSE 22 3000

#map this volume to host directory where you want your persistent data
#VOLUME ["/root/host"]
#DEVCON_DEFAULT_HOST_DIRECTORY=/root/host

VOLUME ["/root/host"]

#build time
RUN date > ${DEVCON_SETUP_DIRECTORY}/build_time.txt

COPY init.sh /sbin/
RUN chmod 755 /sbin/init.sh
CMD ["/sbin/init.sh"]
