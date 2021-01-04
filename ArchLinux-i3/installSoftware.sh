#!/bin/bash
#* This is a overall install file 
#* You should use this file after system has been installed

#* To configure i3
cp -r ./i3 ~/.config/i3

#* To install the system software
sh ./系统配置/install.sh

#* To install the software
sh ./软件安装/script/install.sh

#* To install the dev environment
sh ./开发环境/install.sh