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
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/dracula/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/dracula
sudo pacman -S autojump

sudo pacman -S kitty        \
               tmux         \
               pcmanfm-gtk3 \
               gvfs         \
               ranger       \
               w3m          \
               highlight    \
               mediainfo    \
               poppler      \
               unrar        \
               trash-cli    \
               7zip         \
               unrar        \
               atool        \
               ncdu         \
               htop         \
               neofetch     \
               polybar      \
               arandr       \
               neofetch

yay -S dragon-drop

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

#* To install gvim
sudo pacman -S gvim

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
               goldendict-ng     \
               xournalpp

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                      network                      ####
###########################################################

#* To install clash
sudo pacman -S clash-premium-bin \
               w3m               \
               telegram-desktop  \
               youtube-dl-git    \
               qbittorrent       \
               proxychains-ng

#* To install qq
yay -S linuxqq-nt-bwrap

#* To install Microsoft Edge
yay -S microsoft-edge-stable-bin

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
               feh

sudo pacman -S spotify
yay -S spotify-tray-git

sudo pacman -S mutt      \
               fetchmail \
               procmail  \
               msmtp

sudo pacman -S mpv        \
               obs-studio \
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
               rofi-greenclip
yay -S rofi-bluetooth-git
yay -S networkmanager-dmenu-git

sudo pacman -S chezmoi            \
               gnome-keyring      \
               seahorse           \
               github-cli         \
yay -S stretchly-bin

###########################################################
####                        End                        ####
###########################################################
