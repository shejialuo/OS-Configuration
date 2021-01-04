#!/bin/bash
#* This script is for installing zsh and configure it

###########################################################
####                        Zsh                        ####
###########################################################
#* To install zsh
sudo pacman -S zsh

#* To install oh-my-zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#* To install fonts to support oh-my-zsh
sudo pacman -S powerline-fonts

#* To change the shell to zsh
chsh -s /bin/zsh

#* To install plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo pacman -S autojump

#* To add the configuration to .zshrc
echo 'export ZSH="/home/shejialuo/.oh-my-zsh"' > ~/.zshrc
echo 'ZSH_THEME="agnoster"' >> ~/.zshrc
echo 'plugins=(git zsh-autosuggestions web-search autojump zsh-syntax-highlighting)' >> ~/.zshrc
echo 'source $ZSH/oh-my-zsh.sh' >> ~/.zshrc

###########################################################
####                        End                        ####
###########################################################