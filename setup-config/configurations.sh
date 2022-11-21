#various configurations done during image build

source /etc/profile.d/devcon.sh


#create group and user
groupadd --gid ${DEVCON_GROUP_ID} ${DEVCON_GROUP_NAME}
useradd --uid ${DEVCON_USER_ID} --gid ${DEVCON_USER_NAME} --shell /bin/bash --create-home ${DEVCON_USER_NAME}

#wetty service
WETTY_PORT=3000
file=/etc/systemd/system/wetty.service
nodepath=$(cat /etc/profile.d/nodejs.sh |sed "s/export PATH=//g" | sed "s/\:\$PATH//g")
#start wetty:
#wetty --host 0.0.0.0 --port 3000 --title WeTTY --base /
#--host 0.0.0.0 --port 3000 --title WeTTY --base / --ssl-key /root/.ssl/wetty.key --ssl-cert /root/.ssl/wetty.crt
cat > $file << EOF
[Unit]
Description=Wetty Web Terminal
After=network.target

[Service]
Type=simple
WorkingDirectory=/root/.devcon/.local/share/yarn/global/node_modules/wetty
ExecStart=$nodepath/node . --host 0.0.0.0 --port $WETTY_PORT --title WeTTY --base / --ssl-key /root/.ssl/wetty.key --ssl-cert /root/.ssl/wetty.crt
TimeoutStopSec=20
KillMode=mixed
Restart=always
RestartSec=2

[Install]
WantedBy=multi-user.target
EOF
ln -s /etc/systemd/system/wetty.service /etc/systemd/system/multi-user.target.wants/wetty.service


#setup ulimits, required at least for MongoDB 
echo "#Added by docker build, configurations.sh script" >> /etc/security/limits.conf
echo "*               -       memlock          unlimited" >> /etc/security/limits.conf
echo "*               -       nofile           64000" >> /etc/security/limits.conf


#Execute custom init script when booting the system
#like when starting Docker container
#see https://www.mauras.ch/systemd-run-it-last.html

file=/etc/systemd/system/lastcommand.target
cat > $file << EOF
[Unit]
Description=Startup complete
Requires=multi-user.target
After=multi-user.target
AllowIsolate=yes
EOF

cat > /sbin/last-command.sh << EOF
#!/bin/bash

#add commands to be executed as the last command of systemd startup
rm -f /run/nologin 

EOF
chmod +x /sbin/last-command.sh

file=/etc/systemd/system/lastcommand.service
cat > $file << EOF
[Unit]
Description=Last command
After=multi-user.target

[Service]
#EnvironmentFile=/etc/profile.d/devcon-environment.sh
Type=simple
ExecStart=/sbin/last-command.sh

[Install]
WantedBy=lastcommand.target
EOF

mkdir -p /etc/systemd/system/lastcommand.target.wants
ln -s /etc/systemd/system/lastcommand.service /etc/systemd/system/lastcommand.target.wants/lastcommand.service
ln -sf /etc/systemd/system/lastcommand.target /etc/systemd/system/default.target
