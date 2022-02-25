cdir=$(pwd)

#.tmux.git installed in root home directory
cd /root
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf 

#tmux config setup
mv $cdir/.tmux.conf.local /root/

#install tmux plugin packages during build by starting session and killing it
tmux new-session -d -s build && sleep 5 && tmux kill-session -t build

cd $cdir
