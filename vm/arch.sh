#!/bin/sh
DIR="$(dirname $0)"

sudo pacman -Syu
sudo pacman -S neovim zsh git github-cli btop bat php rustup starship rsync gitui

gh auth status | grep "Logged in" || gh auth login

"$DIR/../install/gitconfig.sh"
"$DIR/../install/themes.sh"

