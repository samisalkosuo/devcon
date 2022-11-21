#install and configure WeTTY
#https://github.com/butlerx/wetty
#instructions: https://github.com/butlerx/wetty/blob/main/docs/atoz.md

#source environment variables
source /etc/profile.d/devcon.sh


#generate certificate
mkdir -p ~/.ssl

#create certificate for wetty
openssl req -x509 -newkey rsa:4096 -sha256 -days 10950 -nodes \
  -out ~/.ssl/wetty.crt -keyout ~/.ssl/wetty.key \
  -subj "/C=FI/ST=None/L=None/O=Sami Salkosuo/OU=DevCon/CN=WeTTY" \
  -addext "subjectAltName=DNS:wetty,DNS:devcon,DNS:localhost,IP:127.0.0.1"

chmod 700 ~/.ssl
chmod 644 ~/.ssl/wetty.crt
chmod 600 ~/.ssl/wetty.key

source ~/.bash_profile

npm install -g yarn --prefix /usr/local
yarn global add wetty --prefix /usr/local
