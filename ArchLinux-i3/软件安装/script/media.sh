#!/bin/bash

###########################################################
####                      Image                        ####
###########################################################

sudo pacman -S viewnior
sudo pacman -S shotwell
sudo pacman -S imagemagick
sudo pacman -S guetzli
sudo pacman -S gpick
sudo pacman -S flameshot
sudo pacman -S nitrogen

###########################################################
####                        End                        ####
###########################################################

###########################################################
####                       Audio                       ####
###########################################################

sudo pacman -S spotify
sudo pacman -S spotify-tui

sudo pacman -S mpd
sudo pacman -S timidity++
#* To configure mpd
directoryPath=~/.config/mpd
if [ -d "$directoryPath" ]
then
    cp ../media/music/mpd.conf "$directoryPath/mpd.conf"
    mkdir "$directoryPath/playlists"
else
    mkdir $directoryPath
    cp ../media/music/mpd.conf "$directoryPath/mpd.conf"
    mkdir "$directoryPath/playlists"
fi

sudo pacman -S ncmpcpp
#* To configure ncmpcpp
directoryPath=~/.config/ncmpcpp
if [ -d "$directoryPath" ]
then
    cp ../media/music/config "$directoryPath/config"
else
    mkdir ~/.config/ncmpcpp
    cp ../media/music/config "$directoryPath/config"
fi

sudo pacman -S mpc

#* To install music tag
sudo pacman -S easytag
###########################################################
####                        End                        ####
###########################################################


###########################################################
####                        Mail                       ####
###########################################################

#* To install mutt
sudo pacman -S mutt

#* To configure mutt
cp -r ../media/mail/mutt ~/.config
chmod 600 ~/.config/mutt/muttrc

#* To install fetchmail
yay -S fetchmail

#* To configure fetchmail
cp ../media/mail/.fetchmailrc ~/.fetchmailrc
chmod 600 ~/.fetchmailrc

#* To install procmail
sudo pacman -S procmail

#* To configure procmail
cp ../media/mail/.procmailrc ~/.procmailrc
chmod 600 ~/.procmailrc

#* To intstall msmtp
sudo pacman -S msmtp

#* To configure msmtp
cp ../media/mail/.msmtprc ~/.msmtprc
chmod 600 ~/.msmtprc

###########################################################
####                        End                        ####
###########################################################

###########################################################
####                        Vedio                      ####
###########################################################

#* To install mpv
sudo pacman -S mpv

#* To install screenrecorder
sudo pacman -S simplescreenrecorder

#* To install shotcut
sudo pacman -S shotcut

###########################################################
####                        End                        ####
###########################################################