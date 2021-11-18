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

sudo pacman -S alacritty \
               pcmanfm  \
               ranger    \
               highlight \
               w3m       \
               mediainfo \
               trash-cli \
               p7zip     \
               ncdu      \
               htop      \
               conky     \
               neofetch  \
               polybar   \
               ao

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                   Input Method                    ####
###########################################################
sudo pacman -S fcitx5                \
               fcitx5-qt             \
               fcitx5-gtk            \
               fcitx5-configtool     \
               fcitx5-chinese-addons \
               fcitx5-mozc           \
               fcitx5-material-color \
               fcitx5-pinyin-moegirl

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
yay -S ttf-wps-fonts

sudo pacman -S pandoc            \
               zotero            \
               zathura           \
               zathura-pdf-mupdf \
               calibre           \
               zeal              \
               goldendict

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                      network                      ####
###########################################################

#* To install clash
sudo pacman -S clash            \
               w3m              \
               tor              \
               tor-browser      \
               telegram-desktop \
               aria2            \
               youtube-dl       \
               qbittorrent      \
               nitroshare       \
               newsboat         \
               proxychains-ng   \
               create_ap

#* To install Microsoft Edge
yay -S microsoft-edge-dev

###########################################################
####                       End                         ####
###########################################################



###########################################################
####                      media                        ####
###########################################################

sudo pacman -S viewnior    \
               shotwell    \
               imagemagick \
               guetzli     \
               gpick       \
               flameshot   \
               nitrogen

sudo pacman -S spotify    \
               mpd        \
               timidity++ \
               ncmpcpp    \
               mpc        \
               easytag

yay -S spotify-tray-git

sudo pacman -S mutt      \
               fetchmail \
               procmail  \
               msmtp

sudo pacman -S mpv                  \
               simplescreenrecorder \
               shotcut

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

sudo pacman -S rofi               \
               drawio-desktop-bin \
               chezmoi            \
               gnome-keyring      \
               seahorse           \
               arandr             \
               github-cli

###########################################################
####                        End                        ####
###########################################################