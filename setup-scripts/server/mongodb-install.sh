#install MongoDB 

MONGODB_VERSION=6.0

#set releasever variable
source /etc/os-release

releasever=$REDHAT_SUPPORT_PRODUCT_VERSION
__repofile=/etc/yum.repos.d/mongodb-org-6.0.repo
cat > $__repofile << EOF
[mongodb-org-6.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/6.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc
EOF

dnf install -y mongodb-org

systemctl daemon-reload
