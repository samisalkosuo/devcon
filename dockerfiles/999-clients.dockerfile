FROM kazhar/devcon:tools

#postgresql client install
COPY setup/both/009-postgresql-client-install.sh .
RUN sh -e 009-postgresql-client-install.sh

#ibmcloud install
COPY setup/both/008-ibmcloud-install.sh .
RUN sh -e 008-ibmcloud-install.sh

#openshift client install
COPY setup/both/0100-openshift-client-install.sh .
RUN sh -e 0100-openshift-client-install.sh


