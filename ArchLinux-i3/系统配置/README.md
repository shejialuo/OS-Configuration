# 系统配置

## 1 系统DM

用lightDM作为系统的display manager。

```shell
sudo pacman -S lightdm
sudo systemctl enable lightdm
```

### 1.1 安装greeter

为了好看的登录界面，安装`lightdm-webkit2-greeter`。

```shell
sudo pacman -S lightdm-webkit2-greeter
```

### 1.2 安装主题及相关配置

```shell
yay -S lightdm-webkit-theme-material-git
```

#### 1.2.1 背景图片

登录的背景图片位于目录`/var/lib/AccountsService/wallpapers`。注意在命令行使用`lightdm-webkit2-greeter`，进入`Setting`，选择`background engine`为`image`。(见`lightdm-webkit2-greeter.conf`文件)。注意文件的权限。

#### 1.2.2 登录头像

用户头像的目录位于`var/lib/AccountsService/icons`。注意在`/var/lib/AccountsService/users`新建文件`$USER`，输入以下内容：

```shell
[User]
Icon=/var/lib/AccountsService/icons/shejialuo.jpg
```

#### 1.2.3 lightDM设置

编辑文件`/etc/lightdm/lightdm.conf`,设置`greeter-session=lightdm-webkit2-greeter`。

#### 1.2.4 双显示器问题

可能存在双显示问题，自写脚本解决。在`/etc/lightdm.conf`，设置`display-setup-script=/usr/bin/lightDMScript.sh`。

## 2 网络管理

启动`NetworkManager`服务(必须禁用其他网络服务。)，并安装托盘`nm-applet`。

```shell
sudo systemctl enable NetworkManager
sudo pacman -S network-manager-applet
```

并在i3的配置文件中，自动启动`nm-applet`。

## 3 音频管理

### 3.1 ALSA安装

```shell
sudo pacman -S alsa-utils
```

### 3.2 管理

```shell
sudo pacman -S pulseaudio
sudo pacman -S pavucontrol
sudo pacman -S pamixer
```

在i3配置文件中，可利用`pamixer`快捷键音量调节。

### 3.3 托盘安装

```shell
yay -S pa-applet-git
```

并在i3的配置文件中，自动启动`pa-applet`。

## 4 系统主题设置

安装GTK2、GTK3主题管理器：`lxappearance`。

```shell
sudo pacman -S lxappearance
```

### 4.1 GTK主题选择

选择`material`主题：

```shell
sudo pacman -S materia-gtk-theme
```

### 4.2 Icon主题选择

选择`papirus-icon-theme`：

```shell
sudo pacman -S papirus-icon-theme
```

### 4.3 QT主题

QT主题与GTK主题相统一。首先安装QT主题管理器：

```shell
sudo pacman -S qt5ct
```

其次通过`yay`安装插件：

```shell
yay -S qt5-styleplugins
```

在`~/.xprofile`中添加语句：

```shell
export QT_QPA_PLATFORMTHEME=gtk2
```

打开`qt5ct`，将QT主题设置为gtk2。

## 5 混成器安装

利用`picom`实现透明化及毛玻璃等特效。

```shell
sudo pacman -S picom
```

此部分见配置文件`compton.conf`，并在i3配置文件中设置自启。

## 6 字体设置

### 6.1 安装常见字体

```shell
sudo pacman -S ttf-sarasa-gothic
sudo pacman -S ttf-fira-code
sudo pacman -S ttf-font-awesome
sudo pacman -S noto-fonts
sudo pacman -S noto-fonts-cjk
sudo pacman -S noto-fonts-emoji
sudo pacman -S ttf-font-icons
```

### 6.2 字体配置

对`~/.config/fontconfig/fonts.conf`进行配置。默认字体为`Fira Code`。

## 7 通知管理

安装`dunst`，作为通知管理的守护进程，其初始配置文件位于`/usr/share/dunst/dunstrc`。

```shell
sudo pacman -S dunst
```

### 7.1 使用说明

```shell
man dunst
```

### 7.2 dunst配置

配置文件位于`~/.config/dunst/dunstrc`。

### 7.3 dunstctl使用

在i3中配置`dunstctl action`用来跳转通知（即时通讯软件）。

## 8 蓝牙管理

### 8.1 蓝牙协议栈安装

```shell
sudo pacman -S bluez
```

### 8.2 工具包安装

终端管理工具：

```shell
sudo pacman -S bluez-utils
```

### 8.3 托盘安装

GUI管理工具：

```shell
sudo pacman -S blueman
```

## 9 亮度管理

安装`xorg-xbacklight`:

```shell
sudo pacman -S xorg-xbacklight
```

## 10 挂载

### 10.1 自动挂载

```shell
sudo pacman -S ntfs-3g
```

自动挂载与Windows To Go的公共机械盘，修改`/etc/fstab`文件如下：

```shell
# /dev/sda3
UUID=6A56CF5056CF1BA7 /mnt ntfs-3g   rw,auto,users,uid=1000,gid=1000,dmask=022,fmask=133 0 0
```

### 10.2 andorid挂载

```shell
sudo pacman -S mtpfs
yay -S jmtpfs
```

利用`jmtpfs`进行挂载：`jmtpfs -o allow_other /mnt/android`

利用`fusermount`umount：`fusermount -u /mnt/android`。

### 10.3 iphone挂载

[ArchWiki参考](https://wiki.archlinux.org/index.php/IOS)

由于IOS的市场更新，为了确保软件的使用，采用`git`版本。注意每次ArchLinux更新视情况是否重新编译.

```shell
yay -S ifuse-git
```

#### 10.3.1 配对

```shell
idevicepair pair
```

#### 10.3.2 配对媒体目录

```shell
ifuse -o allow_other mountpoint
```

#### 10.3.3 配对应用文档

```shell
ifuse --list-apps
ifuse --documents org.vediolan.vlc-ios mountpoint
```

## 11 其他

### 11.1 关闭终端Beep

参照[ArchWiki](https://wiki.archlinux.org/index.php/PC_speaker)

```shell
sudo echo "blacklist pcspkr" | tee /etc/modprobe.d/nobeep.conf
```

### 11.2 默认程序设置

参照[ArchWiki](https://wiki.archlinux.org/title/XDG_MIME_Applications)

使用`mimeapps.list`管理默认程序。
