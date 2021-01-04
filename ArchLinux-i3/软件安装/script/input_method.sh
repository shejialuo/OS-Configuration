#!/bin/bash

###########################################################
####                   Input Method                    ####
###########################################################
sudo pacman -S fcitx5
sudo pacman -S fcitx5-qt
sudo pacman -S fcitx5-gtk
sudo pacman -S fcitx5-configtool
sudo pacman -S fcitx5-chinese-addons
sudo pacman -S fcitx5-mozc
sudo pacman -S fcitx5-material-color
sudo pacman -S fcitx5-pinyin-moegirl
echo "INPUT_METHOD  DEFAULT=fcitx" >> ~/.pam_environment
echo "GTK_IM_MODULE DEFAULT=fcitx" >> ~/.pam_environment
echo "QT_IM_MODULE  DEFAULT=fcitx" >> ~/.pam_environment
echo "XMODIFIERS    DEFAULT=\@im=fcitx" >> ~/.pam_environment

###########################################################
####                       End                         ####
###########################################################