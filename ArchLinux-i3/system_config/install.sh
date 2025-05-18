#!/bin/bash

#* To install DM
sudo pacman -S sddm
sudo systemctl enable sddm

git clone https://github.com/shejialuo/sddm-theme-clairvoyance \
/usr/share/sddm/themes/clairvoyance

#* To install network management
sudo systemctl enable NetworkManager
sudo pacman -S network-manager-applet dhclient

#* To install sound management
sudo pacman -S alsa-utils \
               pipewire wireplumber pipewire-audio pipewire-alsa pipewire-pulse \
               pavucontrol \
               pamixer
yay -S pa-applet-git

#* To install system themes management
sudo pacman -S lxappearance \
               materia-gtk-theme \
               papirus-icon-theme \
               qt5ct \
               qt6ct

#* To install compositor
sudo pacman -S picom

#* To install font management
sudo pacman -S ttf-fira-code \
               ttf-font-awesome \
               noto-fonts \
               noto-fonts-cjk \
               noto-fonts-emoji \
yay -S ttf-font-icons \
       otf-san-francisco

#* To install notification mansagement
sudo pacman -S dunst

#* To install bluetooth management
sudo pacman -S bluez \
               bluez-utils \
               blueman

#* To install brightness management
sudo pacman -S xorg-xbacklight
