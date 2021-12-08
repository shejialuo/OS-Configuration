#!/bin/bash

#* To install DM
sudo pacman -S lightdm \
               lightdm-webkit2-greeter
sudo systemctl enable lightdm
yay -S lightdm-webkit-theme-material-git

#* To install network management
sudo systemctl enable NetworkManager
sudo pacman -S network-manager-applet dhclient

#* To install sound management
sudo pacman -S alsa-utils \
               pipewire-pulse \
               pavucontrol \
               pamixer
yay -S pa-applet-git

#* To install system themes management
sudo pacman -S lxappearance \
               materia-gtk-theme \
               papirus-icon-theme \
               qt5ct
yay -S qt5-styleplugins

#* To install compositor
sudo pacman -S picom

#* To install font management
sudo pacman -S ttf-fira-code \
               ttf-font-awesome \
               noto-fonts \
               noto-fonts-cjk \
               noto-fonts-emoji
yay -S ttf-font-icons \
       ttf-material-design-iconic-font

#* To install notification management
sudo pacman -S dunst

#* To install bluetooth management
sudo pacman -S bluez \
               bluez-utils \
               blueman

#* To install brightness management
sudo pacman -S xorg-xbacklight

#* To install MS support
sudo pacman -S ntfs-3g
#* To install android mount support
sudo pacman -S mtpfs
yay -S jmtpfs
#* To install iphone mount support
yay -S ifuse-git
