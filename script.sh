#!/bin/bash

# errors management
set -e

# Packages installation
echo "=> Installing needed packages"
sudo pacman -Syu --needed --noconfirm hyprland kitty wofi nano xdg-user-dirs base-devel

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
yay -Syu visual-studio-code-bin --noconfirm --needed

# Copying config files
cp -f Configs/hyprland.conf $HOME/.config/hypr/hyperland.conf