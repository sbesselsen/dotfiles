#!/bin/sh
DIR="$(dirname $0)"

mkdir -p ~/.config/btop/themes
rsync -a "$DIR/themes/catppuccin/btop/" ~/.config/btop/themes
sed -i 's/^.*color_theme.*$/color_theme="catppuccin_frappe"/' ~/.config/btop/btop.conf

BAT_DIR="$(bat --config-dir)"
sudo mkdir -p "$BAT_DIR/themes" 
sudo chown -R sbesselsen "$BAT_DIR"
rsync -a "$DIR/themes/catppuccin/bat/" "$BAT_DIR/themes"
echo '--theme="Catppuccin Frappe"' >> "$(bat --config-file)"
bat cache --build
