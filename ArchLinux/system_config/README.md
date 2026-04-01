# 系统配置

## 1 基本配置

### 1.1 网络管理

启动`NetworkManager`服务(必须禁用其他网络服务。)，并安装托盘`nm-applet`。

```sh
sudo systemctl enable NetworkManager
sudo pacman -S network-manager-applet
```

安装`dhclinet`作为DHCP client。参考[ArchWiki](https://wiki.archlinux.org/title/NetworkManager#DHCP_client)

```sh
sudo pacman -S dhclient
```

### 1.2 音频管理

```sh
sudo pacman -S alsa-utils
sudo pacman -S pipewire wireplumber pipewire-audio pipewire-alsa pipewire-pulse
sudo pacman -S pavucontrol
sudo pacman -S pamixer
```

可利用`pamixer`快捷键音量调节。

### 1.3 蓝牙管理

#### 蓝牙协议栈安装

```sh
sudo pacman -S bluez
```

#### 工具包安装

终端管理工具：

```sh
sudo pacman -S bluez-utils
```

#### 托盘安装

GUI 管理工具：

```sh
sudo pacman -S blueman
```

#### 双系统蓝牙问题

双系统存在蓝牙的问题。

> Basically, when you pair your device, your Bluetooth service generates a unique set of pairing keys. First, your computer stores the Bluetooth device's MAC address and pairing key. Second, your Bluetooth device stores your computer's MAC address and the matching key. This usually works fine, but the MAC address for your Bluetooth port will be the same on both Linux and Windows (it is set on the hardware level). Thus, when you re-pair the device in Windows or Linux and it generates a new key, that key overwrites the previously stored key on the Bluetooth device. Windows overwrites the Linux key and vice versa.

[ArchWiki 解决方案](https://wiki.archlinux.org/title/Bluetooth#Dual_boot_pairing)

### 1.4 固件更新

安装`fwupd`:

```sh
sudo pacman -S fwupd
```

### 1.5 时间同步

使用`systemd-timesyncd`进行时间同步。

```sh
sudo mkdir -p /etc/systemd/timesyncd.conf.d
sudo vim /etc/systemd/timesyncd.conf.d/local.conf
```

添加如下的内容：

```conf
[Time]
NTP=ntp.ntsc.ac.cn cn.pool.ntp.org
```

然后执行如下的shell命令：

```sh
sudo systemctl restart systemd-timesyncd.service
sudo timedatectl set-ntp true
```

### 1.6 禁用AUR DEBUG

改变`/etc/makepkg.conf`，将`debug`改为`!debug`。

### 1.7 Nvidia驱动

```c++
sudo pacman -S nvidia-open nvidia-prime nvidia-settings nvidia-utils opencl-nvidia
```

### 1.8 电源管理

+ `shutdown`：关机。
+ `systemctl suspend`：挂起到内存。
+ `systemctl hibernate`：挂起到交换空间(硬盘)。
+ `systemctl hybrid-sleep`：既挂起到内存又挂起到交换空间。
+ `systemctl suspend-then-hibernate`：先挂起到内存再挂起到交换空间。

挂起到硬盘需要进行配置。首先要得到交换空间的UUID。

```sh
lsblk -o name,mountpoint,size,uuid
```

然后，编辑`/etc/default/grub`, 将相关参数加入内核启动参数中找到`GRUB_CMDLINE_LINUX_DEFAULT`一行，在其值后添加类似如下数据

```ini
resume=UUID=<value>
```

然后更新Grub。

```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

此之外，还需配置`initranfs`的`resume`钩子。编辑`/etc/mkinitcpio.conf`，在`HOOKS`行添加`resume`值。注意，`resume`需要加入在`udev`后。

最后通过以下命令重新生成`initramfs`镜像：

```sh
sudo mkinitcpio -P
```

## 2 桌面环境构建

### 2.1 Hyprland

原来我使用[i3wm](https://i3wm.org/)作为桌面环境，现在wayland比起当时成熟了太多，故切换到了Hyprland

```sh
sudo pacman -S hyprland hyprpaper hypridle hyprlock
```

尽管使用wayland，但仍然保留基本的xserver以及Xwayland（SDDM也需要xserver的依赖）:

```sh
sudo pacman -S xorg-server \
               xorg-fonts-encodings \
               xorg-server \
               xorg-server-common \
               xorg-setxkbmap \
               xorg-xauth \
               xorg-xkbcomp \
               xorg-xlsclients \
               xorg-xprop \
               xorg-xwayland \
               xorg-xwininfo
```

### 2.2 系统DM

使用sddm作为系统的display manager。

```sh
sudo pacman -S sddm
sudo systemctl enable sddm
```

使用QT6主题：[sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme)

在目录`/etc/sddm.conf.d`中创建以下的文件。

```conf
# theme.conf
[Theme]
Current=sddm-astronaut-theme
autoFocusPassword=true
```

```conf
# general.conf
[General]
GreeterEnvironment=QT_SCREEN_SCALE_FACTORS=2,QT_FONT_DPI=192
InputMethod=qtvirtualkeyboard
```

### 2.3 系统主题设置

安装GTK3主题管理器：`lxappearance-gtk3`。完全抛弃GTK2。

```sh
sudo pacman -S lxappearance-gtk3
```

#### GTK主题选择

选择`material`主题：

```sh
sudo pacman -S materia-gtk-theme
```

#### 图标主题选择

选择`papirus-icon-theme`还得安装其继承的主题`breeze-icons`:

```sh
sudo pacman -S papirus-icon-theme breeze-icons
```

现在许多应用图标采取[SNI协议](https://www.freedesktop.org/wiki/Specifications/StatusNotifierItem/)，
i3不是一个完整的桌面环境，需要安装`snixembed`实现支持。然而Sway完全不需要。：

#### QT 主题

QT主题过于麻烦，原先我采取的思路是让QT5和QT6都使用GTK2的主题，即使用如下的方式处理：

```sh
sudo pacman -S qt5ct qt6ct
yay -S qt5-styleplugins qt6gtk2
```

然后设置`/etc/environment`:

```sh
QT_QPA_PLATFORMTHEME=gtk2
```

然而，QT6可以是直接通过在`/etc/environment`里面设置`QT_QPA_PLATFORMTHEME=gtk3`来支持GTK3主题的。所以尽可能使用的软件基于QT6。

目前唯一我安装的基于QT5的软件是flameshot。由于是截图软件几乎没有主题的影响。

### 2.4 字体设置

#### 英文字体

`sans-serif`采用苹果的SF Pro字体：

```sh
yay -S otf-san-francisco
```

`serif`采用`sans-serif`字体，不想为这个进行单独设计。

`mono`字体采用Fira Code字体：

```sh
sudo pacman -S ttf-fira-code
```

同时有些配置需要用到Jetbrains的mono字体，用于配置文件：

```sh
sudo pacman -S ttf-jetbrains-mono
```

#### 中文字体

中文字体比较好处理，直接安装Google的Noto字体就可以包含`serif`，`sans-serif`和`mono`字体。同时安装好看的文楷字体。

```sh
sudo pacman -S noto-fonts
sudo pacman -S noto-fonts-cjk
yay -S ttf-lxgw-wenkai
```

#### Unicode icon字体

```sh
sudo pacman -S ttf-nerd-fonts-symbols
sudo pacman -S ttf-nerd-fonts-symbols-commons
sudo pacman -S noto-fonts-emoji
```

#### 字体配置

对`~/.config/fontconfig/fonts.conf`进行配置。详细参考 `dotfiles`。

可以使用`fc-match`命令进行检测：

```sh
fc-match serif:lang=en
fc-match sans-serif:lang=en
fc-match mono:lang=en
fc-match serif:lang=zh
fc-match sans-serif:lang=zh
fc-match mono:lang=zh
```

### 2.5 通知管理

安装`dunst`，作为通知管理的守护进程。

```sh
sudo pacman -S dunst
```

### 2.6 亮度管理

安装`brightnessctl`:

```sh
sudo pacman -S brightnessctl
```

### 2.7 剪贴板管理

```sh
sudo pacman -S wl-clipboard wl-clip-persist cliphist
```

### 2.8 截图工具

```sh
sudo pacman -S grim slurp satty
```

### 2.9 XDG Desktop Portal

Wayland需要安装特定的Portal 用来分享屏幕和录屏:

```sh
sudo pacman -S xdg-desktop-portal
sudo pacman -S xdg-desktop-portal-gtk
sudo pacman -S xdg-desktop-portal-hyprland
```

当登陆进`sway` session的时候，会使用`/usr/share/xdg-desktop-portal/sway-portals.conf`配置文件。

尽管我们设置了GTK主题，但是不会生效，参考[GTK-3-settings-on-Wayland](https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland)。

如果color-scheme不对，可以使用如下的命令：

```sh
gsettings set org.gnome.desktop.interface color-scheme 'default'
```

### 2.10 默认应用程序

参照[ArchWiki](https://wiki.archlinux.org/title/XDG_MIME_Applications)

```sh
ln -s ~/.config/mimeapps.list ~/.local/share/applications/mimeapps.list
```

使用`mimeapps.list`管理默认程序。

## 3 其他

### 3.1 关闭终端 Beep

参照[ArchWiki](https://wiki.archlinux.org/index.php/PC_speaker)

```sh
sudo echo "blacklist pcspkr" | tee /etc/modprobe.d/nobeep.conf
```

### 3.2 挂载

#### Android 挂载

```sh
sudo pacman -S mtpfs
sudo pacman -S gvfs-mtp
```
