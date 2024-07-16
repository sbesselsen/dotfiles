#!/bin/sh
DIR="$(dirname $0)"

sudo apt update

mkdir -p ~/.local/bin

# Github stuff
sudo apt install gh
gh auth login

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

echo "Run hash -r to update your PATH"

