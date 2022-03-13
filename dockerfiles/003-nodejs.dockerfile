FROM kazhar/devcon:ruby

#nodejs
COPY setup/both/003-nodejs-install.sh .
RUN sh -e 003-nodejs-install.sh
