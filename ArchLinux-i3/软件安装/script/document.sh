#!/bin/bash

###########################################################
####                    Zathura                        ####
###########################################################
#* To install zathura
sudo pacman -S zathura
sudo pacman -S zathura-pdf-mupdf

#* To configure zathura

directoryPath=~/.config/zathura

if [ -d "$directoryPath" ]
then
    touch "$directoryPath/zathurarc"
    echo "set selection-clipboard clipboard" >> "$directoryPath/zathurarc"
else
    mkdir "$directoryPath"
    touch "$directoryPath/zathurarc"
    echo "set selection-clipboard clipboard" >> "$directoryPath/zathurarc"
    
###########################################################
####                        End                        ####
###########################################################

###########################################################
####                     Viewnior                      ####
###########################################################

#* To install viewnior
sudo pacman -S viewnior

###########################################################
####                        End                        ####
###########################################################

###########################################################
####                        Wps                        ####
###########################################################

#* To install wps-office
sudo pacman -S wps-office
sudo pacman -S ttf-wps-fonts

###########################################################
####                        End                        ####
###########################################################

###########################################################
####                    Calibre                        ####
###########################################################

#* To install calibre
sudo pacman -S calibre

###########################################################
####                        End                        ####
###########################################################