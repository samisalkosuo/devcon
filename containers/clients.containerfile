FROM docker.io/kazhar/devcon:latest

RUN devcon-tool openshift-client-install
RUN devcon-tool ibmcloud-install
RUN devcon-tool ibmpakplugin-install

