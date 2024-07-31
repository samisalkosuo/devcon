FROM docker.io/kazhar/devcon:latest

RUN devcon-tool install-ibmcloud-cli
RUN devcon-tool install-ibmpakplugin

RUN devcon-tool install-openshift-client

RUN devcon-tool install-argocd
RUN devcon-tool install-mongosh
RUN devcon-tool install-postgresql-client




