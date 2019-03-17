#!/usr/bin/sh

mkdir ~/aur/
git clone https://aur.archlinux.org/yay.git ~/aur/yay

cd ~/aur/yay
makepkg -si --noconfirm

