FROM kazhar/devcon:base

#python install
COPY setup/both/002-python-install.sh .
RUN sh -e 002-python-install.sh

