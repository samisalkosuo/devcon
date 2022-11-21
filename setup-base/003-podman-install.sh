#install podman in order to use podman inside container
#see: https://www.redhat.com/sysadmin/podman-inside-container

#use --privileged option when executing container

dnf -y reinstall shadow-utils

dnf -y install podman fuse-overlayfs --exclude container-selinux

useradd podman
echo podman:10000:5000 > /etc/subuid
echo podman:10000:5000 > /etc/subgid

mkdir -p /var/lib/containers
mkdir -p /home/podman/.local/share/containers
mkdir -p /home/podman/.config/containers/

cat > /etc/containers/containers.conf << EOF
[containers]
netns="host"
userns="host"
ipcns="host"
utsns="host"
cgroupns="host"
cgroups="disabled"
log_driver = "k8s-file"
[engine]
cgroup_manager = "cgroupfs"
events_logger="file"
runtime="crun"
EOF


cat > /home/podman/.config/containers/containers.conf << EOF
[containers]
volumes = [
	"/proc:/proc",
]
EOF

# chmod containers.conf and adjust storage.conf to enable Fuse storage.
chmod 644 /etc/containers/containers.conf; sed -i -e 's|^#mount_program|mount_program|g' -e '/additionalimage.*/a "/var/lib/shared",' -e 's|^mountopt[[:space:]]*=.*$|mountopt = "nodev,fsync=0"|g' /etc/containers/storage.conf
mkdir -p /var/lib/shared/overlay-images /var/lib/shared/overlay-layers /var/lib/shared/vfs-images /var/lib/shared/vfs-layers; touch /var/lib/shared/overlay-images/images.lock; touch /var/lib/shared/overlay-layers/layers.lock; touch /var/lib/shared/vfs-images/images.lock; touch /var/lib/shared/vfs-layers/layers.lock

chown podman:podman -R /home/podman
