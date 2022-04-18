#! /bin/bash

###########################################################
####                       C and C++                   ####
###########################################################

sudo pacman -S gdb cgdb \
               gcc      \
               valgrind \
               clang    \
               libdwarf

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                         Go                        ####
###########################################################

sudo pacman -S go

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                         Haskell                   ####
###########################################################

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
echo 'export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"' >> ~/.profile

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                       Python                      ####
###########################################################

sudo pacman -S python-pip

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                        NodeJs                     ####
###########################################################

sudo pacman -S nodejs npm
sudo npm install -g @angular/cli
sudo npm install -g @nestjs/cli
sudo npm install -g hexo-cli
sudo npm install picgo -g
sudo npm install -g sql-language-server

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                        Docker                     ####
###########################################################

sudo pacman -S docker

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                        Latex                      ####
###########################################################

sudo pacman -S  texlive-core texlive-langchinese

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                       Gnuplot                     ####
###########################################################

sudo pacman -S gnuplot

###########################################################
####                        End                        ####
###########################################################



###########################################################
####                       Java                        ####
###########################################################

sudo pacman -S jdk11-openjdk scala kotlin

###########################################################
####                        End                        ####
###########################################################

###########################################################
####                       Java                        ####
###########################################################

sudo pacman -S mysql         \
               redis         \
               wireshark-cli
yay -S mongodb-bin

###########################################################
####                        End                        ####
###########################################################
