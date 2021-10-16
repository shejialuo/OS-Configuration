#! /bin/bash

###########################################################
####                        utility                    ####
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
git clone https://github.com/dracula/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/dracula
yay -S autojump


#* To install terminal
sudo pacman -S alacritty

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

#* To install trash mananger
sudo pacman -S trash-cli

#* To install archive manager
sudo pacman -S p7zip

#* To install disk clean
sudo pacman -S ncdu

#* To install htop
sudo pacman -S htop

#* To install conky
sudo pacman -S conky

#* To install neofetch
sudo pacman -S neofetch

###########################################################
####                        End                        ####
###########################################################



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

###########################################################
####                       End                         ####
###########################################################



###########################################################
####                 document_editor                   ####
###########################################################

#* To install typora
sudo pacman -S typora

#* To install gvim
sudo pacman -S gvim
bash ~/.install_vim_plugin.sh

#* To install vscode
yay -S visual-studio-code-bin

#* To install wps-office
yay -S wps-office
sudo pacman -S ttf-wps-fonts

#* To install pandoc
sudo pacman -S pandoc

#* To install zotero
sudo pacman -S zotero

#* To install zathura
sudo pacman -S zathura
sudo pacman -S zathura-pdf-mupdf

#* To install calibre
sudo pacman -S calibre

#* To install zeal
sudo pacman -S zeal

#* To install goldendict
sudo pacman -S goldendict

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                      network                      ####
###########################################################

#* To install clash
sudo pacman -S clash

#* To install Microsoft Edge
yay -S microsoft-edge-dev

#* To install terminal browser
sudo pacman -S w3m

#* To install tor

sudo pacman -S tor tor-browser

#* To install telegram desktop
sudo pacman -S telegram-desktop

#* To install aria2c
sudo pacman -S aria2

#* To install youtube-dl
sudo pacman -S youtube-dl

#* To install qbittorrent
sudo pacman -S qbittorrent

#* To install nitroshare
sudo pacman -S nitroshare

#* To install newsboat
sudo pacman -S newsboat

###########################################################
####                       End                         ####
###########################################################



###########################################################
####                      media                        ####
###########################################################

sudo pacman -S viewnior
sudo pacman -S shotwell
sudo pacman -S imagemagick
sudo pacman -S guetzli
sudo pacman -S gpick
sudo pacman -S flameshot
sudo pacman -S nitrogen

sudo pacman -S spotify
yay -S spotify-tray-git

sudo pacman -S mpd
sudo pacman -S timidity++
sudo pacman -S ncmpcpp

sudo pacman -S mpc

sudo pacman -S easytag

#* To install mutt
sudo pacman -S mutt

#* To install fetchmail
sudo pacman -S fetchmail

#* To install procmail
sudo pacman -S procmail

#* To intstall msmtp
sudo pacman -S msmtp

#* To install mpv
sudo pacman -S mpv

#* To install screenrecorder
sudo pacman -S simplescreenrecorder

#* To install shotcut
sudo pacman -S shotcut

###########################################################
####                        End                        ####
###########################################################


#* To install rclone

sudo pacman -S rclone

###########################################################
####                        End                        ####
###########################################################


###########################################################
####                        Other                      ####
###########################################################

#* To install rofi
sudo pacman -S rofi

#* To install drawio
sudo pacman -S drawio-desktop-bin

#* To install chezmoi
sudo pacman -S chezmoi

sudo pacman -S gnome-kerying
sudo pacman -S seahorse

yay -S wemeet-bin

###########################################################
####                        End                        ####
###########################################################