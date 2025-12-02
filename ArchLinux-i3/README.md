# ArchLinux i3

## 安装

### U 盘

+ 利用 Rufus 制作镜像，以 ios、dd 方式写入均可。
+ 利用`iwctl`进行无线网络的连接，注意使用`rfkill`查看是否 block。
+ 利用`fdisk`进行分区，并格式化分区然后挂载。
  + `mkfs.ext4`: 文件
  + `mkfs.fat`: EFI
+ 安装基本系统：`pacstrap /mnt /base linux linux-firmware vim`
+ 挂载：`sudo mount /dev/... /mnt`, `sudo mount /dev/... /mnt/efi`
+ 生成 fstab 文件：`genfstab -U /mnt >> /mnt/etc/fstab`
+ 切换到新的系统：`arch-chroot /mnt`
+ 时间和区域设置：
  + 区域：`ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime`
  + 时间：`hwclock --systohc`
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
  + `grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=Arch`
  + `grub-mkconfig -o /boot/grub/grub.cfg`

### 系统

+ `systemctl enable --now NetworkManager`然后`nmtui`连接 wifi
+ `useradd -m shejialuo -g shejialuo`
+ 编辑`/etc/sudoers`文件
+ `sudo pacman -S xorg i3-wm`
+ 对于双系统：`sudo pacman -S os-prober`，编辑`/etc/default/grub`文件，然后挂载Windows的启动盘。再执行`grub-mkconfig -o /boot/grub/grub.cfg`。
  + 对于Windows，执行如下的powershell命令，让windows认为是UTC时间。

    ```powershell
    reg add HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation /v RealTimeIsUniversal /t REG_DWORD /d 1
    ```
