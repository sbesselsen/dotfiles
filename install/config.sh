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

