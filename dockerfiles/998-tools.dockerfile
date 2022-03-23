FROM kazhar/devcon:nodejs

#lynx
COPY setup/container/105-lynx-install.sh .
RUN sh -e 105-lynx-install.sh

#w3m
COPY setup/container/106-w3m-install.sh .
RUN sh -e 106-w3m-install.sh

#dumb-init
COPY setup/container/103-dumbinit-install.sh .
RUN sh -e 103-dumbinit-install.sh

#wetty
COPY setup/container/104-wetty-install.sh .
RUN sh -e 104-wetty-install.sh

#terraform
COPY setup/both/004-terraform-install.sh .
RUN sh -e 004-terraform-install.sh

#asciidoctor install
COPY setup/both/006-asciidoctor-install.sh .
RUN sh -e 006-asciidoctor-install.sh

#ffmpeg install
COPY setup/both/007-ffmpeg-install.sh .
RUN sh -e 007-ffmpeg-install.sh

#misc stuff
COPY setup/both/010-misc-installs.sh .
RUN sh -e 010-misc-installs.sh
