#! /bin/bash

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
echo 'alias pc="proxychains4"' >> ~/.zshrc
echo 'alias p-on="export https_proxy=http://127.0.0.1:7890; export http_proxy=http://127.0.0.1:7890"' >> ~/.zshrc
echo 'alias p-off="unset http_proxy https_proxy"' >> ~/.zshrc

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                    Termianl                       ####
###########################################################


sudo pacman -S alacritty

#* To copy the configuration file

#? When using ~, you shouldn't use quote
#? Because it prevents interpreting ~
directoryPath=~/.config/alacritty
if [ -d "$directoryPath" ]
then
    cp ../utility/terminal/alacritty.yml "$directoryPath/alacritty.yml"
else
    mkdir "$directoryPath"
    cp ../utility/terminal/alacritty.yml "$directoryPath/alacritty.yml"
fi

###########################################################
####                       End                         ####
###########################################################



###########################################################
####                        File                       ####
###########################################################

#* To install pcmanfm
sudo pacman -S pcmanfm

#* To install ranger
sudo pacman -S ranger

#* To install highlight for ranger
sudo pacman -S highlight

#* To install w3m for ranger
sudo pacman -S w3m

#* To install mediainfo for ranger
sudo pacman -S mediainfo

cp -r ../utility/ranger ~/.config/

#* To install trash mananger
sudo pacman -S trash-cli

#* To install archive manager
sudo pacman -S p7zip

###########################################################
####                       End                         ####
###########################################################


###########################################################
####                        Disk                       ####
###########################################################

#* To install disk clean
sudo pacman -S ncdu

###########################################################
####                       End                         ####
###########################################################


###########################################################
####                       System                      ####
###########################################################

#* To install htop
sudo pacman -S htop

#* To install conky
sudo pacman -S conky

#* To install neofetch
sudo pacman -S neofetch

###########################################################
####                       End                         ####
###########################################################