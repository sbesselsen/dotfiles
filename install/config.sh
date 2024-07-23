#!/bin/sh
DIR="$(dirname $0)"
FULLDIR="$(realpath $DIR)"

# create symlink only if it does not exist
[ ! -e ~/.config/nvim ] && ln -s "$FULLDIR/../config/nvim" ~/.config/nvim
[ ! -e ~/.config/starship.toml ] && ln -s "$FULLDIR/../config/starship.toml" ~/.config/starship.toml
rm ~/.config/k9s/config.yaml
ln -s "$FULLDIR/../config/k9s/config.yaml" ~/.config/k9s/config.yaml
rm ~/.zshrc
ln -s "$FULLDIR/../config/zshrc.sh" ~/.zshrc

[ ! -e ~/.kube/kubie.yaml ] && ln -s "$FULLDIR/../config/kubie/config.yaml" ~/.kube/kubie.yaml
# let kubie see the k3s config file
mkdir -p ~/.kube/configs
[ ! -e ~/.kube/configs/k3s.yaml ] && ln -s /etc/rancher/k3s/k3s.yaml ~/.kube/configs/k3s.yaml
