#!/bin/bash

set -e

sudo systemctl stop docker
sudo systemctl stop containerd

sudo mkdir -p /srv/docker
sudo mkdir -p /srv/containerd

sudo rsync -aP /var/lib/docker/ /srv/docker/
sudo rsync -aP /var/lib/containerd/ /srv/containerd/

sudo mv /var/lib/docker /var/lib/docker.bkp
sudo mv /var/lib/containerd /var/lib/containerd.bkp

sudo mkdir -p /var/lib/docker
sudo mkdir -p /var/lib/containerd

sudo cp /etc/fstab /etc/fstab.bkp

sudo tee -a /etc/fstab <<EOF
/srv/docker     /var/lib/docker     none    bind    0 0
/srv/containerd /var/lib/containerd none    bind    0 0
EOF

set +e

echo "deu tudo certo"

exit 0
