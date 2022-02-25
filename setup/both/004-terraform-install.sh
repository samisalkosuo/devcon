#terraform install packages from repository
#https://learn.hashicorp.com/tutorials/terraform/install-cli


yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

dnf -y install terraform

dnf clean all
