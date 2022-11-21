#environment variables added to container image


#setup directory, same as in Dockerfile
export DEVCON_SETUP_DIRECTORY=/root/setup-scripts

#default host directory
export DEVCON_DEFAULT_HOST_DIRECTORY=/root/host

#name of the container should be the name of the container host 
#use '-h devcon' option , when starting the container (do not use -e option)
export DEVCON_CONTAINER_NAME=devcon

#runtime directory
export DEVCON_RUNTIME_DIRECTORY=/root/.devcon

#devcon user and group names and IDs
export DEVCON_USER_NAME=devcon
export DEVCON_GROUP_NAME=devcon
export DEVCON_GROUP_ID=1100
export DEVCON_USER_ID=1100

#set XDG export variables
#see: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_DATA_HOME=${DEVCON_RUNTIME_DIRECTORY}/.local/share
export XDG_CONFIG_HOME=${DEVCON_RUNTIME_DIRECTORY}/.config
export XDG_STATE_HOME=${DEVCON_RUNTIME_DIRECTORY}/.local/state
export XDG_CACHE_HOME=${DEVCON_RUNTIME_DIRECTORY}/.cache

#DISPLAY export for X
#use -e DISPLAY to set another DISPLAY
#X-server is needed for Windows: https://sourceforge.net/projects/vcxsrv/ 
#X-server is needed for Mac: https://www.xquartz.org/
export DISPLAY=host.docker.internal:0
#Mac:
#- install xquartz
#- Activate the option ‘Allow connections from network clients’ in XQuartz settings
#- restart XQuartz
#- allow access from localhost, execute on Mac: xhost + 127.0.0.1


#custom variables
export MY_CUSTOM_VARIABLE=VALUE
export TERM=xterm-256color
export EDITOR=vim
export VISUAL=vim
