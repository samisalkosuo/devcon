#devcon base dockerfile
FROM docker.io/rockylinux/rockylinux:9.2

ENV DEVCON_USER=devcon
ENV DEVCON_USER_HOME=/devcon

WORKDIR /setup

#install packages using dnf
COPY setup/base/dnf-install.sh ./
RUN sh -e dnf-install.sh

#create user
COPY setup/base/create-user.sh ./
RUN sh -e create-user.sh

#tmux for user
COPY setup/base/tmux.conf-install.sh ./
COPY setup/base/.tmux.conf.local ./
RUN sh -e tmux.conf-install.sh

#add SSH keys and setup SH
COPY setup/base/ssh-install.sh ./
COPY ssh-keys/* $DEVCON_USER_HOME/.ssh/
RUN chmod 600 $DEVCON_USER_HOME/.ssh/* && sh -e ssh-install.sh

#add CA authority
COPY setup/base/certificate-authority.sh ./
RUN sh -e certificate-authority.sh

#install nodejs
COPY setup/base/nodejs-install.sh ./
RUN sh -e nodejs-install.sh

#install wetty
COPY setup/base/wetty-install.sh ./
RUN sh -e wetty-install.sh

#install pid1
COPY setup/base/pid1-install.sh ./
RUN sh -e pid1-install.sh

#copy files

#add helper scripts
COPY setup/scripts/*sh /usr/local/bin
#add devcon-tool scripts
COPY setup/tool/ /setup/tool/
#copy shell-script
COPY setup/devcon-shell /setup
#copy tool-script
COPY setup/devcon-tool /usr/local/bin

#run commands
RUN chmod 755 /usr/local/bin/*sh && \
    chown $DEVCON_USER:$DEVCON_USER -R $DEVCON_USER_HOME && \
    chmod 755 /setup/devcon-shell && \
    chmod 755 /usr/local/bin/devcon-tool

WORKDIR $DEVCON_USER_HOME
USER $DEVCON_USER

#disable cache for rest of build => creates new build time every time
#note: will fail if www.random.org can not be accessed
#see https://stackoverflow.com/a/58801213
#ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

#save build time
RUN date > ~/.build_time 

CMD ["/setup/devcon-shell"]
