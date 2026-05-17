#!/bin/bash

# errors management
set -e

# Packages installation
echo "=> Installing needed packages"
sudo pacman -Syu --needed --noconfirm hyprland kitty wofi nano xdg-user-dirs base-devel

mkdir -p $HOME/.config/hypr

# Directories managment
xdg-user-dirs-update

# yay installation
echo "=> Installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Visual Studio Code
yay -S --noconfirm --needed visual-studio-code-bin

# Copying config files
cp -f Configs/hyprland.conf $HOME/.config/hypr/hyprland.conf