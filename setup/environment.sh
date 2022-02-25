#setup environment and environment variables 
#when starting the container

#NOTE: if any of these variables are given by -e option when starting the container
#they won't work, these variables override any variables given by -e options

export MY_CUSTOM_VARIABLE=VALUE

export TERM=xterm-256color
export EDITOR=vim
export VISUAL=vim
