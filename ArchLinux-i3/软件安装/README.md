# 相关软件安装

## 1 输入法安装

### 1.1 Flexible Input Method Framework 5安装

```shell
sudo pacman -S fcitx5
sudo pacman -S fcitx5-qt
sudo pacman -S fcitx5-gtk
```

### 1.2 Fcitx配置工具安装

```shell
sudo pacman -S fcitx5-configtool
```

### 1.3 拼音安装

```shell
sudo pacman -S fcitx5-chinese-addons
```

### 1.4 日语安装

```shell
sudo pacman -S fcitx5-mozc 
```

### 1.5 配置

在`$HOME`的目录编辑文件`.pam_environment`，如果没有则创建该文件，输入以下信息：

```shell
INPUT_METHOD  DEFAULT=fcitx
GTK_IM_MODULE DEFAULT=fcitx
QT_IM_MODULE  DEFAULT=fcitx
XMODIFIERS    DEFAULT=\@im=fcitx
```

后面进行GUI设置。

+ Trigger Input Method: Left Shift. No enumerate when press trigger key repeatedly
+ Temporally Input Method between first and current Input Method: Control+Space
+ Enumerate Input Method Forward: Control + Left Shitf

### 1.6 Skin下载

```shell
sudo pacman -S fcitx5-material-color
```

单行模式设置： 在`fcitx5-configtool`中`Addons`中的`pinyin`勾选选项`show preedit within application`。

### 1.7 中文词库下载

```shell
sudo pacman -S fcitx5-pinyin-moegirl
```

## 2 编辑器安装

### 2.1 Typora安装

安装MarkDown编辑器：

```shell
sudo pacman -S typora
```

### 2.2 Gvim安装

`vim`并不能使用系统的剪贴板，安装`gvim`。

```shell
sudo pacman -S gvim
```

配置文件见`.vimrc`。通过`pacman`安装会自动安装到`/usr/share/vim/vimfiles/plugin`。所有的插件均采用`pacman`安装方式，尽可能只是用`pacman`方式安装。

#### 2.2.1 airline插件安装

用于进行状态栏的显示。

```shell
sudo pacman -S vim-airline
```

#### 2.2.2 nerdtree插件安装

用于目录的显示。

```shell
sudo pacman -S vim-nerdtree
```

#### 2.2.3 ale插件安装

异步检查代码。

```shell
sudo pacman -S vim-ale
```

需要自己安装相应的linter。此处请参照开发环境配置。

#### 2.2.4 ctrlp插件安装

使用模糊搜索。

```shell
sudo pacman -S vim-ctrlp
```

#### 2.2.5 nerdcommenter插件安装

快速注释功能:

```shell
sudo pacman -S vim-nerdcommenter
```

#### 2.2.6 surround插件安装

高效操作与括号、引号或html、xml标签相关的配对符号：

```shell
sudo pacman -S vim-surround
```

#### 2.2.7 tagbar插件安装

```shell
sudo pacman -S vim-tagbar
```

#### 2.2.8 wiki插件安装

```shell
yay -S vim-vimwiki
```

### 2.3 VsCode安装

```shell
sudo pacman -S visual-studio-code-bin
```

现在`VsCode`自带同步功能，双系统很方便，直接同步。

### 2.4 代码段上传

采用Gist上传小段代码段（GitHub服务）。

```shell
sudo pacman -S gist
```

## 3 Zsh安装

直接通过pacman包管理器安装：

```shell
sudo pacman -S zsh
```
### 3.1 安装 Oh-My-Zsh

以下过程参考Oh-My-Zsh的GitHub项目主页。

#### 3.1.1 通过 curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### 3.1.2 通过 wget

```shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 3.2 安装 Powerline字体

```shell
sudo pacman -S powerline-fonts
```

### 3.3 更改终端

在终端输入以下命令：

```shell
chsh -s /bin/zsh
```

重启终端查看是否修改成功：

```shell
echo $SHELL
```

### 3.4 Oh-My-Zsh的配置

本部分主要参考其GitHub项目的Wiki。

#### 3.4.1 相关插件下载

+ zsh-syntax-highlighting
  ```shell
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  ```
+ zsh-autosuggestions
  ```shell
  git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  ```
+ autojump
  ```shell
  sudo pacman -S autojump
  ```

#### 3.4.2 配置

在`.zshrc`中输入以下信息：

```shell
export ZSH="/home/shejialuo/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions web-search autojump zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
```

## 4 终端安装

### 4.1 Kitty 安装

想让终端支持Fira Code，故从Sakura转变为Kitty。

```shell
sudo pacman -S kitty
```

为了使得kitty支持fcitx5，在`~/.pam_environment`中添加：

```shell
GLFW_IM_MODULE DEFAULT=ibus
```

## 5 代理软件安装

### 5.1 Electron-ssr 安装

通过`yay`安装：

```shell
yay -S electron-ssr
```

### 5.2 Clash for linux 安装

安装很简单，但是安装后会下载`MMDB`，不跑代理很慢。默认HTTP端口为7890,默认socks端口为7891。

```shell
sudo pacman -S clash
```

#### 5.2.1 后台运行方式不能自动更新订阅
clash正在运行，可以访问`http://clash.razord.top`。

启动clash，可以直接后台运行，但是不能自动更新配置文件：

```shell
nohup clash > dev/null 2>&1 &
```

#### 5.2.2 服务运行方式自动更新订阅
由于后台运行的方式无法实现订阅的自动更新，将clash封装成服务，每次启动时进行一次更新。新建文件`/usr/lib/systemd/system/clash.service`:

```shell
[Unit]
Description=clash
After=NetworkManager.target

[Service]
WorkingDirectory=/home/shejialuo/.config/clash
ExecStart=/home/shejialuo/.config/clash/start-clash.sh
ExecStop=/home/shejialuo/.config/clash/stop-clash.sh
Environment="HOME=/home/shejialuo"
Environment="CLASH_URL=your subscribe address"

[Install]
WantedBy=multi.user.target
```

`start-clash.sh`和`stop-clash.sh`见文件，注意权限。

## 6 媒体安装

### 6.1 Spotify 安装

安装流媒体Spotify：

```shell
sudo pacman -S spotify
```

### 6.2 本地音乐播放器安装

#### 6.2.1 Mpd 安装
安装music player daemon:

```shell
sudo pacman -S mpd
```

在`~/.config/mpd/mpd.conf`中配置。


##### 6.2.1.1 相关依赖安装

```shell
sudo pacman -S timidity++
```

#### 6.2.2 ncmpcpp 安装

```shell
sudo pacman -S ncmpcpp
```

在文件`~/.config/ncmpcpp/config`配置。

#### 6.2.3 mpc安装

命令行控制工具：

```shell
sudo pacman -S mpc
```

#### 6.2.4 easytag 安装

安装标签编辑工具，虽然ncmpcpp自带编辑tag功能，主要为了添加封面：

```shell
sudo pacman -S easytag
```

### 6.3 邮件客户端安装

#### 6.3.1 Mutt 安装

```shell
sudo pacman -S mutt
```

Mutt仅仅只是一个收发邮件的中转站，UNIX哲学。其配置文件位于`~/.config/mutt/muttrc`：

```shell
chmod 600 ~/.config/mutt/muttrc
```

#### 6.3.2 Fetchmail 安装

```shell
yay -S fetchmail
```

用于收取邮件的软件，其配置文件位于`~/.fetchmailrc`：

```shell
chmod 600 ~/.fetchmailrc
```

#### 6.3.3 Procmail 安装

```shell
sudo pacman -S procmail
```

用于存储邮件的软件，其配置文件位于`~/.procmailrc`：

```shell
chmod 600 ~/.procmailrc
```

#### 6.3.4 Msmtp 安装

```shell
sudo pacman -S msmtp
```

用于发送邮件的软件，其配置文件位于`~/.mstmtprc`。


### 6.4 视频播放器安装

安装mplayer视频播放器：

```shell
sudo pacman -S mplayer
```

## 7 浏览器安装 

### 7.1 Google chrome 安装

```shell
sudo pacman -S google-chrome
```

安装完`google chrome`后，需要安装`SwitchyOmega`，但是无法访问chrome商店。可以使用`google-chrome-stable --proxy-server="socks5://127.0.0.1:port"命令行代理配置。

### 7.2 Microsoft edge 安装

目前只有dev版本（不支持登录），通过`yay`安装：

```shell
yay -S microsoft-edge-dev 
```

## 8 文件管理安装

### 8.1 Pcmanfm 安装

安装GUI文件管理器（备用）：

```shell
sudo pacman -S pcmanfm
```

### 8.2 Ranger 安装

主程序安装：

```shell
sudo pacman -S ranger
```

#### 8.2.1 高亮代码

```shell
sudo pacman -S highlight
```

#### 8.2.2 HTML预览

```shell
sudo pacman -S w3m
```

#### 8.2.3 Media预览

```shell
sudo pacman -S mediainfo
```

#### 8.2.4 图片预览

在`rc.conf`中设置图片预览为`true`即可。

### 8.3 回收站

```shell
sudo pacman -S trash-cli
```

回收站位于`~/.local/share/Trash`。

## 9 文档查看器安装

### 9.1 Zathura 安装
```shell
sudo pacman -S zathura
```

在`~/.config/zathura/zathurarc`中进行配置，以便直接复制到剪贴板：

```shell
set selection-clipboard clipboard
```

#### 9.1.1 安装相关依赖

```shell
sudo pacman -S zathura-pdf-mupdf
```

#### 9.1.2 使用说明

```shell
man zathura
```

### 9.2 Viewnior 安装

安装GUI图片查看器：

```shell
sudo pacman -S viewnior
```

### 9.3 Wps安装

```shell
sudo pacman -S wps-office
sudo pacman -S ttf-wps-fonts
```

### 9.4 Calibre安装

```shell
sudo pacman -S calibre
```

### 9.5 Zeal安装

开发文档查看器：

```shell
sudo pacman -S zeal
```

### 9.6 Pandoc安装

安装文档转换工具：

```shell
sudo pacman -S pandoc
```

## 10 即时通讯软件安装

### 10.1 Telegram 安装

```shell
sudo pacman -S telegram
```
#### 10.1.1 解决无法输入中文问题

找到`/usr/share/applications/telegramdesktop.desktop`文件，在`Exec`行中加入：

```shell
env QT_IM_MODULE=fcitx
```

### 10.2 QQ 安装

```shell
sudo pacman -S qq
```

### 10.3 Wechat 安装

腾讯为UOS开发了Linux版微信：

```shell
yay -S wechat-uos
```

## 11 云盘和存储工具

### 11.1 Onedrive 安装

```shell
sudo pacman -S onedrive
```

有必要总结一下用法，Onedrive总共有两种模式：

+ `--synchronize`：手动同步。
+ `--monitor`：自动同步。

尽可能不使用`--monitor`，同步的事情需要谨慎。

在这两种模式下，不加其他命令行参数直接与文件夹整个同步，不推荐直接使用。两种模式拥有额外的命令行参数：

+ `--upload-only`：仅仅上传本地文件。
  + `--remove-source-files`：上传成功后，删除源文件。
  + `--no-remote-delete`: 不删除Onedrive上的文件。
+ `--download-only`：仅仅下载Onedrive上的文件。

其他还有如下的命令行参数：

`--remove-directory`：删除Onedrive上的文件，不同步。
`--create-directory`：在Onedrive上创建文件，不同步。

### 11.2 Googledrive 安装

```shell
yay -S drive-bin
```

新建文件夹`~/Sync/GoogleDrive`，并输入以下信息：

```shell
drive init
```

使用比Onedrive人性化，和Git命令类似。使用时`man`即可。

### 11.3 FTP服务器安装

```shell
sudo pacman -S vsftpd
```

## 12 其他工具安装

### 12.1 Nitrogen 安装
处理壁纸，直接安装即可，在i3配置文件自动启动加上`--restore`：

```shell
sudo pacman -S nitrogen
```

### 12.2 Flameshot 安装

截图软件安装：

```shell
sudo pacman -S flameshot
```

### 12.3 Gpick 安装

屏幕取色工具：

```shell
sudo pacman -S gpick
```

### 12.4 Rofi 安装

使用`rofi`作为`dmenu`的替代品。

```shell
sudo pacman -S rofi
```

### 12.5 Goldendict 安装

安装字典：

```shell
sudo pacman -S goldendict
```

注意对词典进行备份。

### 12.6 Tlp 安装

安装电源管理并开机自启：

```shell
sudo pacman -S tlp
systemctl enable tlp
```

### 12.7 Aria2 安装

下载工具安装：

```shell
sudo pacman -S aria2
```

[配置参考](https://github.com/P3TERX/aria2.conf)

### 12.8 录屏软件安装

```shell
sudo pacman -S simplescreenrecorder
```

### 12.9 压缩工具

安装终端7z：

```shell
sudo pacman -S p7zip
```

### 12.10 磁盘清理工具

```shell
sudo pacman -S ncdu
```

### 12.11 密码管理工具

```shell
sudo pacman -S keepassxc
```

与OneDrive进行同步即可。

### 12.12 Youtube-dl安装

```shell
sudo pacman -S youtube-dl
```