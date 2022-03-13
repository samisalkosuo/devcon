#PostgreSQL client install
#see https://www.postgresql.org/download/linux/redhat/

POSTGRESQL_CLIENT_VERSION=14.2

POSTGRESQL_SHORTVERSION=$(echo $POSTGRESQL_CLIENT_VERSION |sed "s/\./ /g" |awk '{print $1}')

# Install the repository RPM:
dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Disable the built-in PostgreSQL module:
dnf -qy module disable postgresql

#show version info from rep
#dnf --showduplicates list postgresql14

psql_package=postgresql${POSTGRESQL_SHORTVERSION}
psql_version=${POSTGRESQL_CLIENT_VERSION}-1PGDG.rhel8  

dnf -y install ${psql_package}-${psql_version}

ex