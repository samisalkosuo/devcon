FROM kazhar/devcon:clients

#packages from repo
COPY setup/both/misc/000-dnf-install.sh .
RUN sh -e 000-dnf-install.sh

#2048
COPY setup/both/misc/001-2048-install.sh .
RUN sh -e 001-2048-install.sh

#cmatrix
COPY setup/both/misc/002-cmatrix-install.sh .
RUN sh -e 002-cmatrix-install.sh

#rain
COPY setup/both/misc/003-rain-install.sh .
RUN sh -e 003-rain-install.sh

