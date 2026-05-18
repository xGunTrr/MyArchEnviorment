#!/bin/bash

# errors management
set -e

# Packages installation
echo "=> Installing needed packages"
sudo pacman -Syu --needed --noconfirm hyprland kitty wofi nano xdg-user-dirs base-devel sddm

mkdir -p $HOME/.config/hypr
mkdir -p $HOME/.config/kitty

# Directories managment
xdg-user-dirs-update

# Enable sddm
sudo systemctl enable sddm

# yay installation
echo "=> Installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Visual Studio Code, Google Chrome
yay -S --noconfirm --needed visual-studio-code-bin google-chrome swww

# Copying config files
cp -f Configs/hyprland.conf $HOME/.config/hypr/hyprland.conf
cp -f Configs/kitty.conf $HOME/.config/kitty/

mkdir -p $HOME/Pictures/Wallpapers
cp Wallpapers/totoro-wallpaper.jpg $HOME/Pictures/Wallpapers

awww img $HOME/Pictures/Wallpapers