#terraform install packages from repository
#https://learn.hashicorp.com/tutorials/terraform/install-cli

#check latest version
#https://github.com/hashicorp/terraform/releases

yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

dnf -y install terraform

