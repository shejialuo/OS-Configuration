#!/bin/bash

###########################################################
####                     Typora                        ####
###########################################################

#* To install typora
sudo pacman -S typora

###########################################################
####                        End                        ####
###########################################################

###########################################################
####                       gvim                        ####
###########################################################

#* To install gvim
sudo pacman -S gvim
##* To install vim-airline
sudo pacman -S vim-airline
##* To install vim-nerdtree
sudo pacman -S vim-nerdtree
##* To install vim-ale
sudo pacman -S vim-ale
##* To install vim-ctrlp
sudo pacman -S vim-ctrlp
##* To install vim-nerdcommenter
sudo pacman -S vim-nerdcommenter
##* To install vim-surround
sudo pacman -S vim-surround
##* To install vim-tagbar
sudo pacman -S vim-tagbar
##* To install vim-vimwiki
yay -S vim-vimwiki

#* To configure gvim
cp ../vim/.vimrc ~/.vimrc

###########################################################
####                    End                            ####
###########################################################

###########################################################
####                    Vscode                         ####
###########################################################

#* To install vscode
sudo pacman -S visual-studio-code-bin

###########################################################
####                        End                        ####
###########################################################