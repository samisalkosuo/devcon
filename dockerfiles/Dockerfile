#the main devcon Dockerfile extends clients-image or misc-image
#FROM kazhar/devcon:clients
FROM kazhar/devcon:misc

#name of the container should be the name of the container host 
#use '-h devcon' option , when starting the container (do not use -e option)
ENV DEVCON_CONTAINER_NAME=devcon

#working directory
WORKDIR /root/setup

#environment variables to setup directory
COPY setup/environment.sh .

#working directory
WORKDIR /root

#create directories
RUN mkdir -p /root/host && \
    mkdir -p /root/tmp && \
    mkdir -p /root/bin

#====ENVIRONMENT VARIABLES SECTION START
#set runtime environment variables
#devcon-shell.sh script sets variables to .bash_profile 
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

#build time
RUN date > /root/setup/build_time.txt

COPY devcon-shell.sh .

CMD ["sh","/root/devcon-shell.sh"]
