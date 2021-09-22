#!/bin/bash
#* This is a overall install file 
#* You should use this file after system has been installed
#! However you need to install a proxy software because of GFW

#* To install the system software
sh ./system_config/install.sh

#* To install the software
sh ./software/install.sh

#* To install the dev environment
sh ./development/install.sh

#* To get the dotfiles.
chezmoi init https://github.com/shejialuo/dotfiles.git
chezmoi apply