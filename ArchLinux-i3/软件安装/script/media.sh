#!/bin/bash

###########################################################
####                    Spotify                        ####
###########################################################

#* To install spotify
sudo pacman -S spotify

###########################################################
####                        End                        ####
###########################################################

###########################################################
####                        Mpd                        ####
###########################################################

#* To install mpd
sudo pacman -S mpd
#** To install some dependency
sudo pacman -S timidity++

#* To configure mpd
directoryPath=~/.config/mpd
if [ -d "$directoryPath" ]
then
    cp ../music/mpd.conf "$directoryPath/mpd.conf"
    mkdir "$directoryPath/playlists"
else
    mkdir $directoryPath
    cp ../music/mpd.conf "$directoryPath/mpd.conf"
    mkdir "$directoryPath/playlists"
fi

###########################################################
####                        End                        ####
###########################################################

###########################################################
####                       Ncmpcpp                     ####
###########################################################

#* To install ncmpcpp
sudo pacman -S ncmpcpp

directoryPath=~/.config/ncmpcpp

if [ -d "$directoryPath" ]
then
    cp ../music/config "$directoryPath/config"
else
    mkdir ~/.config/ncmpcpp
    cp ../music/config "$directoryPath/config"


###########################################################
####                        End                        ####
###########################################################

###########################################################
####                        Mpc                        ####
###########################################################

#* To install mpc
sudo pacman -S mpc

###########################################################
####                        End                        ####
###########################################################

###########################################################
####                    Musci Tag Editor               ####
###########################################################

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
cp -r ../mail/mutt ~/.config/mutt
chmod 600 .config/mutt/muttrc

#* To install fetchmail
yay -S fetchmail

#* To configure fetchmail
cp ../mail/.fetchmailrc ~/.fetchmailrc
chmod 600 ~/.fetchmailrc

#* To install procmail
sudo pacman -S procmail

#* To configure procmail
cp ../mail/.procmailrc ~/.procmailrc
chmod 600 ~/.procmailrc

#* To intstall msmtp
sudo pacman -S msmtp

#* To configure msmtp
cp ../mail/.msmtprc ~/.msmtprc
chmod 600 ~/.msmtprc

###########################################################
####                        End                        ####
###########################################################

###########################################################
####                        Mplayer                    ####
###########################################################

#* To install mplayer
sudo pacman -S mplayer

###########################################################
####                        End                        ####
###########################################################