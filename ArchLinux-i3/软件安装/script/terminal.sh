#!/bin/bash
###########################################################
####                    Kitty                          ####
###########################################################

#* To install kitty
sudo pacman -S sakura

#* To copy the configuration file

#? When using ~, you shouldn't use quote
#? Because it prevents interpreting ~
directoryPath=~/.config/kitty
if [ -d "$directoryPath" ]
then
    cp ../kitty/kitty.conf "$directoryPath/kitty.conf"
else
    mkdir "$directoryPath"
    cp ../kitty/kitty.conf "$directoryPath/kitty.conf"
fi

echo "GLFW_IM_MODULE DEFAULT=ibus" >> ~/.pam_environment

###########################################################
####                       End                         ####
###########################################################