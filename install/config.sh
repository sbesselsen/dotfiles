#!/bin/sh
DIR="$(dirname $0)"
FULLDIR="$(realpath $DIR)"

# create symlink only if it does not exist
[ ! -e ~/.config/nvim ] && ln -s "$FULLDIR/../config/nvim" ~/.config/nvim
