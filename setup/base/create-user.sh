

USER_ID=24816
groupadd -g $USER_ID $DEVCON_USER

useradd $DEVCON_USER -d $DEVCON_USER_HOME -G wheel -g $USER_ID -u $USER_ID

echo "$DEVCON_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
