#!/bin/sh
DIR="$(dirname $0)"
FULLDIR="$(realpath $DIR)"

sudo mkdir -p /etc/rancher/k3s
[ ! -e /etc/rancher/k3s/config.yaml ] && sudo ln -s "$FULLDIR/../config/k3s/config.yaml" /etc/rancher/k3s/config.yaml 
curl -sfL https://get.k3s.io | sh -

sudo chmod a+r /etc/rancher/k3s/k3s.yaml

# don't start on boot
sudo systemctl disable k3s

