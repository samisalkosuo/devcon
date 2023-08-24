#configure tmux
#see:
#https://dev.to/iggredible/useful-tmux-configuration-examples-k3g
#https://tmuxcheatsheet.com/

cdir=$(pwd)

function setupTmuxConfigFile
{
    cat > .tmux.conf << EOF
#tmux config file

#enable mouse
#set -g mouse on

#set history limit
set-option -g history-limit 5000

#keep current path when creating new window
bind c new-window -c "#{pane_current_path}"

#split pane shortcuts, horizontal and vertical
bind | split-window -hc "#{pane_current_path}"
bind - split-window -vc "#{pane_current_path}"
EOF

}

#configure for devcon user
cd $DEVCON_USER_HOME
setupTmuxConfigFile
chown $DEVCON_USER:$DEVCON_USER .tmux.conf

#configure for root
cd /root
setupTmuxConfigFile

cd $cdir
