FROM kazhar/devcon:python

#ruby install
COPY setup/both/005-ruby-install.sh .
RUN sh -e 005-ruby-install.sh

