#!/bin/sh
DIR="$(dirname $0)"

sudo pacman -Syu
sudo pacman -S neovim zsh git github-cli btop bat php rustup starship rsync gitui extra/unzip extra/eza zoxide extra/tldr k9s 

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
. "$HOME/.asdf/asdf.sh"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 22.4.1 
asdf global nodejs 22.4.1

gh auth status | grep "Logged in" || gh auth login

"$DIR/../install/gitconfig.sh"
"$DIR/../install/themes.sh"
"$DIR/../install/config.sh"
"$DIR/../install/awscli.sh"

