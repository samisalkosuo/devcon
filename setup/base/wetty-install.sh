#install and configure WeTTY
#https://github.com/butlerx/wetty
#instructions: https://github.com/butlerx/wetty/blob/main/docs/atoz.md

#Note: v2.6.0 fit to screen does not work
WETTY_VERSION=2.5.0

#certificate directory
mkdir -p $DEVCON_USER_HOME/.ssl

#create certificate for wetty
create-certificate.sh -c "DevCon WeTTY" -I "127.0.0.1" wetty localhost devcon

mv certificate.crt $DEVCON_USER_HOME/.ssl/wetty.crt
mv certificate.key $DEVCON_USER_HOME/.ssl/wetty.key
chmod 700 $DEVCON_USER_HOME/.ssl
chmod 644 $DEVCON_USER_HOME/.ssl/wetty.crt
chmod 600 $DEVCON_USER_HOME/.ssl/wetty.key
#chown -R $DEVCON_USER:$DEVCON_USER ~/.ssl/

#chmod 700 ~/.ssl
#chmod 644 ~/.ssl/wetty.crt
#chmod 600 ~/.ssl/wetty.key

source ~/.bash_profile

npm install -g yarn --prefix /usr/local
yarn global add wetty@$WETTY_VERSION  --prefix /usr/local
