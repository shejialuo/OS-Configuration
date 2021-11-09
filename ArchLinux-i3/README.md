# ArchLinux i3

## 配置

主要是记录在 i3 过程中的一系列的配置过程。并对 i3 的配置文件进行备份。

主要分为 4 个部分：

+ i3
+ development
+ system_config
+ software

---

采用 AUR 安装的软件，注意依赖关系：

+ microsoft-edge-dev-bin
+ lightdm-webkit-theme-material-git
+ pa-applet-git
+ qt5-styleplugins
+ jmtpfs
+ autojump
+ visual-studio-code-bin
+ wps-office
+ ttf-wps-fonts
+ spotify-tray-git
+ ifuse-git
+ ttf-material-design-iconic-font

## 安装

### U 盘

+ 利用 Rufus 制作镜像，以 ios、dd 方式写入均可。
+ 利用`iwctl`进行无线网络的连接，注意使用`rfkill`查看是否 block。
+ 利用`fdisk`进行分区，并格式化分区然后挂载。
  + `mkfs.ext4`: 文件
  + `mkfs.fat`: EFI
  + `mkswap` and `swapon`: swap
+ 安装基本系统：`pacstrap /mnt /base linux linux-firmware vim`
+ 生成 fstab 文件：`genfstab -U /mnt >> /mnt/etc/fstab`
+ 切换到新的系统：`arch-chroot /mnt`
+ 时间和区域设置：
  + 区域：`ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime`
  + 时间：`hwclock --systohc` and `timedatectl set-local-rtc true`
+ 语言设置：
  + `vim /etc/locale.gen`
  + `locale-gen`
  + `vim /etc/locale.conf`写入`LANG=en_US.UTF-8`
+ 写入 hostname: `vim /etc/hostname`
+ 修改 hosts: `vim /etc/hosts`

  ```txt
  127.0.0.1 localhost
  ::1 localhost
  127.0.1.1 ArchLinux.localdomain ArchLinux
  ```

+ `passwd`
+ 基本软件：`pacman -S grub efibootmgr networkmanager wireless_tools wpa_supplicant base-devel reflector git sudo linux-headers`
+ grub 配置：
  + `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch`
  + `grub-mkconfig -o /boot/grub/grub.cfg`

### 系统

+ `systemctl enable --now NetworkManager`然后`nmtui`连接 wifi
+ `useradd -m shejialuo -g shejialuo`
+ 编辑`/etc/sudoers`文件
+ `sudo pacman -S xorg i3-gaps`
