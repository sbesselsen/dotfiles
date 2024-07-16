#!/bin/sh
DIR="$(dirname $0)"

sudo apt update

mkdir -p ~/.local/bin

# zsh
sudo apt install zsh

# Git config
"$DIR/../install/gitconfig.sh"

# Github stuff
sudo apt install gh
gh auth status | grep "Logged in" || gh auth login

# btop
sudo apt install btop
mkdir -p ~/.config/btop/themes
rsync -a "$DIR/themes/catppuccin/btop/" ~/.config/btop/themes
sed -i 's/^.*color_theme.*$/color_theme="catppuccin_frappe"/' ~/.config/btop/btop.conf

# bat
sudo apt install bat
[ ! -e ~/.local/bin/bat ] && ln -s /usr/bin/batcat ~/.local/bin/bat
BAT_DIR="$(batcat --config-dir)"
sudo mkdir -p "$BAT_DIR/themes" 
sudo chown -R sbesselsen "$BAT_DIR"
rsync -a "$DIR/themes/catppuccin/bat/" "$BAT_DIR/themes"
echo '--theme="Catppuccin Frappe"' >> "$(batcat --config-file)"
batcat cache --build

# php (for personal shell scripts)
sudo apt install --no-install-recommends php-cli 

# Rust
if ! which rustup >/dev/null; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	. "$HOME/.cargo/env"
fi

# gitui
sudo apt install gcc libssl-dev make # needed to build gitui/openssl
cargo install gitui --locked

echo "Run hash -r to update your PATH"

