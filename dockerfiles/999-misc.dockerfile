FROM kazhar/devcon:clients

#misc stuff
COPY setup/both/010-misc-installs.sh .
RUN sh -e 010-misc-installs.sh
