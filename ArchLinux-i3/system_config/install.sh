#!/bin/bash

#* To install DM
sudo pacman -S lightdm
sudo systemctl enable lightdm
sudo pacman -S lightdm-webkit2-greeter
yay -S lightdm-webkit-theme-material-git

#* To install network management
sudo systemctl enable NetworkManager
sudo pacman -S network-manager-applet
sudo pacman -S dhclient

#* To install sound management
sudo pacman -S alsa-utils
sudo pacman -S pulseaudio
sudo pacman -S pavucontrol
sudo pacman -S pamixer
sudo pacman -S pulseaudio-bluetooth
yay -S pa-applet-git

#* To install system themes management
sudo pacman -S lxappearance
sudo pacman -S materia-gtk-theme
sudo pacman -S papirus-icon-theme
sudo pacman -S qt5ct
yay -S qt5-styleplugins

#* To install compositor
sudo pacman -S picom

#* To install font management
sudo pacman -S ttf-sarasa-gothic
sudo pacman -S ttf-fira-code
sudo pacman -S ttf-font-awesome
sudo pacman -S noto-fonts
sudo pacman -S noto-fonts-cjk
sudo pacman -S noto-fonts-emoji
yay -S ttf-font-icons
yay -S ttf-material-design-iconic-font

#* To install notification management
sudo pacman -S dunst
#* To configure dunst
cp -r ./dunst ~/.config/

#* To install bluetooth management
sudo pacman -S bluez
sudo pacman -S bluez-utils
sudo pacman -S blueman

#* To install brightness management
sudo pacman -S xorg-xbacklight

#* To install MS support
sudo pacman -S ntfs-3g
#* To install android mount support
sudo pacman -S mtpfs
yay -S jmtpfs
#* To install iphone mount support
yay -S ifuse-git
