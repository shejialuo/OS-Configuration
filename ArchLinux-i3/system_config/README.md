# 系统配置

## 1 系统 DM

更换 sddm 作为系统的 display manager。

```shell
sudo pacman -S sddm
sudo systemctl enable sddm
```

### 1.1 安装主题

```shell
git clone https://github.com/shejialuo/sddm-theme-clairvoyance /usr/share/sddm/themes/clairvoyance
```

#### 1.1.1 背景图片

登录的背景图片位于目录`/usr/share/sddm/themes/clairvoyance/Assets/background.jpg`。注意名字保持一致，不要修改配置文件。

#### 1.1.2 登录头像

用户头像的目录位于`/usr/share/sddm/faces`，文件名为`<username>.face.icon`。

### 1.2 配置文件

在目录`/etc/sddm.conf.d`中创建以下的文件。

```conf
# theme.conf
[Theme]
Current=clairvoyance
autoFocusPassword=true
enableHDPI=true
```

```conf
# x11.conf
[X11]
EnableHiDPI=true
```

## 2 网络管理

启动`NetworkManager`服务(必须禁用其他网络服务。)，并安装托盘`nm-applet`。

```shell
sudo systemctl enable NetworkManager
sudo pacman -S network-manager-applet
```

安装`dhclinet`作为 DHCP client。参考[ArchWiki](https://wiki.archlinux.org/title/NetworkManager#DHCP_client)

```shell
sudo pacman -S dhclient
```

## 3 音频管理

### 3.1 ALSA 安装

```shell
sudo pacman -S alsa-utils
```

### 3.2 管理

使用 ArchWiki 推荐的`pipewire`管理。

```shell
sudo pacman -S pipewire-pulse
sudo pacman -S pavucontrol
sudo pacman -S pamixer
```

在 i3 配置文件中，可利用`pamixer`快捷键音量调节。

### 3.3 托盘安装

```shell
yay -S pa-applet-git
```

并在 i3 的配置文件中，自动启动`pa-applet`。

## 4 系统主题设置

安装 GTK2 主题管理器：`lxappearance`。

```shell
sudo pacman -S lxappearance
```

### 4.1 GTK 主题选择

选择`material`主题：

```shell
sudo pacman -S materia-gtk-theme
```

### 4.2 Icon 主题选择

选择`papirus-icon-theme`：

```shell
sudo pacman -S papirus-icon-theme
```

### 4.3 QT 主题

目前在Arch里面有应用使用QT5，有应用使用QT6，QT 主题与 GTK 主题相统一。首先安装 QT 主题管理器：

```shell
sudo pacman -S qt5ct qt6ct
```

其次通过`yay`安装style plugin插件：

```shell
yay -S qt5-styleplugins qt6gtk2
```

在`/etc/environment`中添加语句：

```shell
QT_QPA_PLATFORMTHEME=gtk2
```

打开`qt5ct`，将 QT 主题设置为 gtk2。

## 5 混成器安装

利用`picom`实现透明化及毛玻璃等特效。

```shell
sudo pacman -S picom
```

此部分见配置文件`picom.conf`，并在 i3 配置文件中设置自启。

## 6 字体设置

### 6.1 安装常见字体

```shell
sudo pacman -S ttf-fira-code
sudo pacman -S ttf-fira-sans
sudo pacman -S ttf-font-awesome
sudo pacman -S noto-fonts
sudo pacman -S noto-fonts-cjk
sudo pacman -S noto-fonts-emoji
sudo pacman -S ttf-fira-mono
yay -S ttf-font-icons
yay -S ttf-material-design-iconic-font
yay -S otf-san-francisco-new-york
```

### 6.2 字体配置

对`~/.config/fontconfig/fonts.conf`进行配置。详细参考 `dotfiles`。

## 7 通知管理

安装`dunst`，作为通知管理的守护进程。

```shell
sudo pacman -S dunst
```

### 7.1 使用说明

```shell
man dunst
```

### 7.2 dunst 配置

配置文件位于`~/.config/dunst/dunstrc`。

### 7.3 dunstctl 使用

在 i3 中配置`dunstctl action`用来跳转通知（即时通讯软件）。

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

GUI 管理工具：

```shell
sudo pacman -S blueman
```

### 8.4 双系统蓝牙问题

双系统存在蓝牙的问题。

> Basically, when you pair your device, your Bluetooth service generates a unique set of pairing keys. First, your computer stores the Bluetooth device's MAC address and pairing key. Second, your Bluetooth device stores your computer's MAC address and the matching key. This usually works fine, but the MAC address for your Bluetooth port will be the same on both Linux and Windows (it is set on the hardware level). Thus, when you re-pair the device in Windows or Linux and it generates a new key, that key overwrites the previously stored key on the Bluetooth device. Windows overwrites the Linux key and vice versa.

[ArchWiki 解决方案](https://wiki.archlinux.org/title/Bluetooth#Dual_boot_pairing)

### 8.4 k380 罗技蓝牙键盘存在的问题

入了一个 k380 罗技的蓝牙键盘，安装`k380-function-keys-conf`让 k380 默认开启 Fn。

```shell
yay -S k380-function-keys-conf
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

自动挂载与 Windows To Go 的公共机械盘，修改`/etc/fstab`文件如下：

```shell
# /dev/sda3
UUID=6A56CF5056CF1BA7 /mnt ntfs-3g   rw,auto,users,uid=1000,gid=1000,dmask=022,fmask=133 0 0
```

### 10.2 andorid 挂载

```shell
sudo pacman -S mtpfs
yay -S jmtpfs
```

利用`jmtpfs`进行挂载：`jmtpfs -o allow_other /mnt/android`

利用`fusermount`umount：`fusermount -u /mnt/android`。

### 10.3 iphone 挂载

[ArchWiki 参考](https://wiki.archlinux.org/index.php/IOS)

由于 IOS 的市场更新，为了确保软件的使用，采用`git`版本。注意每次 ArchLinux 更新视情况是否重新编译.

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

#### 10.3.4 自动挂载USB

```sh
sudo pacman -S udisks2
```

## 11 其他

### 11.1 关闭终端 Beep

参照[ArchWiki](https://wiki.archlinux.org/index.php/PC_speaker)

```shell
sudo echo "blacklist pcspkr" | tee /etc/modprobe.d/nobeep.conf
```

### 11.2 默认程序设置

参照[ArchWiki](https://wiki.archlinux.org/title/XDG_MIME_Applications)

```shell
ln -s ~/.config/mimeapps.list ~/.local/share/applications/mimeapps.list
```

使用`mimeapps.list`管理默认程序。

### 11.3 电源管理

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

### 11.4 定时任务

最近需要执行定时任务，安装`crontab`。

```sh
sudo pacman -S cronie
systemctl start cronie.service
```

### 11.5 Nvidia驱动

最近入手了一个2060的显卡，安装驱动

```c++
sudo pacman -S nvidia nvidia-prime nvidia-settings nvidia-utils opencl-nvidia lib32-nvidia-utils lib32-opencl-nvidia
```

### 11.6 时间同步

偶尔时间会出现漂移，使用`ntp`进行时间的同步。

```sh
sudo pacman -S ntp
```

### 11.7 禁用AUR DEBUG

改变`/etc/makepkg.conf`，将`debug`改为`!debug`。
