#!/bin/bash

###########################################################
####                   Onedrive                        ####
###########################################################
#* To install onedrive
sudo pacman -S onedrive

#* To configure onedrive
mkdir -p ~/Sync/OneDrive
cp ../netdisk/onedrive/config "$_/config"

onedrive --synchronize

###########################################################
####                        End                        ####
###########################################################

###########################################################
####                    Googledrive                    ####
###########################################################

#* To install googledrive
yay -S drive-bin

#* To configure googledrive
mkdir ~/Sync/GoogleDrive
cd $_
drive init

###########################################################
####                        End                        ####
###########################################################