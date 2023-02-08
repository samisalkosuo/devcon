FROM devcon:base

RUN sh setup-scripts/tools/terraform-install.sh

RUN sh setup-scripts/clients/openshift-client-install.sh

RUN sh setup-scripts/tools/python/kubeterminal-install.sh


