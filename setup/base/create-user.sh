

useradd $DEVCON_USER -d $DEVCON_USER_HOME -G wheel

echo "$DEVCON_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
