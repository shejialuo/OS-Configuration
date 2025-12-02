# 软件安装

## 1 实用程序

### 1.1 Terminal & Shell

#### 1.1.1 zsh

直接通过 pacman 包管理器安装 `zsh`：

```shell
sudo pacman -S zsh powerline-fonts
```

然后安装`oh-my-zsh`:

通过`curl`：

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```l

对`oh-my-zsh`进行如下的配置：

+ zsh-syntax-highlighting

  ```shell
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  ```

+ zsh-autosuggestions

  ```shell
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  ```

安装[dracula](https://github.com/dracula/zsh)主题。

#### 1.1.2 终端安装

```shell
sudo pacman -S kitty
```

#### 1.1.3 Tmux

```shell
sudo pacman -S tmux
```

安装tmp plugin管理工具。

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

安装[Dracula主题](https://github.com/dracula/tmux)

#### 1.1.4 fzf

[fzf](https://github.com/junegunn/fzf)是一个在terminal里面进行模糊搜索的工具。

```shell
sudo pacman -S fzf
```

#### 1.1.5 zoxide

原先我使用`autojump`，由于会使用`yazi`，直接从`autojump`切换到`zoxide`

```shell
sudo pacman -S zoxide
```

#### 1.1.6 Other Command Line Tools

+ `bat`: `cat`的rust实现。
+ `fd`：`find`的rust实现。
+ `ripgrep`: `grep`的rust实现。

```shell
sudo pacman -S bat fd ripgrep
```

### 1.2 文件管理

### 1.2.1 GUI文件管理器

安装轻量级别软件：

```shell
sudo pacman -S pcmanfm-gtk3 gvfs
```

### 1.2.2 终端文件管理

安装`yazi`，体验比`ranger`好太多。

```shell
sudo pacman -S yazi
```

#### 1.2.2.1 主题

使用 [dracula](https://github.com/yazi-rs/flavors) 主题。

```shell
ya pkg add yazi-rs/flavors:dracula
```

#### 1.2.2.2 预览支持

```shell
sudo pacman -S yazi ffmpeg 7zip jq poppler \
               fd ripgrep fzf zoxide imagemagick mediainfo
```

### 1.2.3 回收站

```shell
sudo pacman -S trash-cli
```

回收站位于`~/.local/share/Trash`。

### 1.2.4 压缩工具

```shell
sudo pacman -S zip
sudo pacman -S 7zip
sudo pacman -S unrar
sudo pacman -S atool
```

### 1.3 磁盘管理

```shell
sudo pacman -S ncdu
```

### 1.4 系统管理

#### 1.4.1 任务管理

```shell
sudo pacman -S htop
```

#### 1.4.2 多显示器管理

```shell
sudo pacman -S arandr
```

### 1.5 任务栏安装

使用 polybar

```shell
sudo pacman -S polybar python-pywal
```

## 2 输入法

### 2.1 Flexible Input Method Framework 5

```shell
sudo pacman -S fcitx5
sudo pacman -S fcitx5-qt
sudo pacman -S fcitx5-gtk
```

### 2.2 配置工具

```shell
sudo pacman -S fcitx5-configtool
```

### 2.3 拼音

```shell
sudo pacman -S fcitx5-chinese-addons
```

### 2.4 日语

```shell
sudo pacman -S fcitx5-mozc
```

### 2.5 配置

`.pam_environment`文件已经被弃用了，需要用在全局。故在`/etc/pam_environment`中，输入
以下信息：

```shell
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus
```

后面进行 GUI 设置。

+ Trigger Input Method: Left Shift. No enumerate when press trigger key repeatedly
+ Temporally Input Method between first and current Input Method: Control+Space
+ Enumerate Input Method Forward: Control + Left Shift

### 2.6 皮肤

```shell
sudo pacman -S fcitx5-material-color
```

单行模式设置： 在`fcitx5-configtool`中`Addons`中的`pinyin`勾选选项`show preedit within application`。

### 2.7 中文词库

```shell
sudo pacman -S fcitx5-pinyin-moegirl
```

## 3 文档与编辑

### 3.1 gvim

`vim`并不能使用系统的剪贴板，安装`gvim`。

```shell
sudo pacman -S gvim
```

### 3.2 VsCode

`archlinuxcn`不再提供`visual-studio-code-bin`的二进制包，详见[issue](https://github.com/archlinuxcn/repo/issues/2460)。只能手动编译了。

```shell
yay -S visual-studio-code-bin
```

现在`VsCode`自带同步功能，双系统很方便，直接同步。

### 3.3 office

安装 wps office：

```shell
yay -S wps-office
yay -S ttf-wps-fonts
```

### 3.4 pandoc

安装 pandoc：

```shell
sudo pacman -S pandoc
```

### 3.5 zotero

安装 zotero：

```shell
sudo pacman -S zotero
```

### 3.6 zathura

```shell
sudo pacman -S zathura
```

在`~/.config/zathura/zathurarc`中进行配置，以便直接复制到剪贴板，同时关闭沙盒以确保能打开链接：

```shell
set selection-clipboard clipboard
set sandbox
```

#### 安装相关依赖

```shell
sudo pacman -S zathura-pdf-mupdf
```

### 3.7 calibre

```shell
sudo pacman -S calibre
```

### 3.8 goldendict

安装字典，使用QT6版本：

```shell
sudo pacman -S goldendict-ng
```

注意对词典进行备份。

### 3.9 xournalpp

目前采用的编辑器基本都是单一的文本，然而有时候需要手动绘图作理解，或者增加一些PDF的批注。`xournalpp`是一个很好用的工具。

```shell
sudo pacman -S xournalpp
```

## 4 网络

### 4.1 代理安装

Install from [clash premium archive](https://downloads.clash.wiki/ClashPremium/)。我希望使用`--user`的方式启动服务，然而clash需要绑定DNS服务器，使用`setcap`:

```sh
sudo setcap 'cap_net_bind_service=+ep' /usr/bin/clash
```

### 4.2 浏览器

#### 4.2.1 Microsoft Edge

安装Stable版本。

```shell
yay -S microsoft-edge-stable-bin
```

安装后登陆微软帐号直接全平台同步，会自动安装插件`SwitchyOmega`，若不能走代理命令行加上参数`--proxy-server="socks5://127.0.0.1:port`。

##### 代理插件安装

直接安装`SwitchyOmega`使用即可，已采用备份。

##### 全键盘操作

安装`Vimium`插件。用法与 vim 的逻辑十分相似。自定义搜索引擎如下：

```txt
w: https://www.wikipedia.org/w/index.php?title=Special:Search&search=%s Wikipedia

# More examples.
#
# (Vimium supports search completion Wikipedia, as
# above, and for these.)
#
g: https://www.google.com/search?q=%s Google
G: https://www.google.com/search?q=%s Google
zh: https://www.zhihu.com/search?type=content&q=%s 知乎
ZH: https://www.zhihu.com/search?type=content&q=%s 知乎
tb: https://s.taobao.com/search?q=%s 淘宝
TB: https://s.taobao.com/search?q=%s 淘宝
jd: https://search.jd.com/Search?keyword=%s 京东
JD: https://search.jd.com/Search?keyword=%s 京东
bd: https://www.baidu.com/s?wd=%s 百度
BD: https://www.baidu.com/s?wd=%s 百度
bz https://search.bilibili.com/all?keyword=%s b站
BZ https://search.bilibili.com/all?keyword=%s b站
b: https://www.bing.com/search?setmkt=en-GB&q=%s 必应
B: https://www.bing.com/search?setmkt=en-GB&q=%s 必应
y: https://www.youtube.com/results?search_query=%s Youtube
Y: https://www.youtube.com/results?search_query=%s Youtube
```

#### 4.2.2 终端浏览器下载

```shell
sudo pacman -S w3m
```

#### 4.2.3 匿名浏览器下载

```shell
sudo pacman -S tor tor-browser
```

### 4.3 即使通讯软件

#### 4.3.1 telegram 安装

```shell
sudo pacman -S telegram-desktop
```

##### 解决无法输入中文问题

找到`/usr/share/applications/telegramdesktop.desktop`文件，在`Exec`行中加入：

在`~/.local/share/applications`添加文件`telegramdesktop.desktop`:

```shell
env QT_IM_MODULE=fcitx
```

##### telegram 代收 QQ 和微信消息

参考 efb-qq-slave 和 efb-wechat-slave

#### 4.3.2 QQ

QQ官方出了本地客户端，用沙盒版本。偶尔用。

```sh
yay -S linuxqq-nt-bwrap
```

### 4.4 下载软件

#### 4.4.1 Aria2 安装

下载工具安装：

```shell
sudo pacman -S aria2
```

[配置参考](https://github.com/P3TERX/aria2.conf)

#### 4.4.2 yt-dlp 安装

```shell
sudo pacman -S yt-dlp
```

#### 4.4.3 qbittorrent 安装

```shell
sudo pacman -S qbittorrent
```

添加 tracer 即可。

### 4.5 终端代理工具

```shell
sudo pacman -S proxychains-ng
```

### 4.6 热点

```shell
sudo pacman -S create_ap
```

配置`/etc/create_ap.conf`:

```sh
WIFI_IFACE=wlp1
INTERNET_IFACE=wlp1s0
SSID=AP_Ali
PASSPHRASE=yourpasswordhere
```

## 5 媒体

### 5.1 图片

#### 5.1.1 GUI 查看器

```shell
sudo pacman -S viewnior
```

#### 5.1.2 图片管理工具

```shell
sudo pacman -S shotwell
```

#### 5.1.3 图片处理工具

```shell
sudo pacman -S imagemagick
```

#### 5.1.4 图片压缩工具

压缩`.png`和`.jpeg`图片：

```shell
sudo pacman -S guetzli
```

#### 5.1.5 取色工具

```shell
sudo pacman -S gpick
```

#### 5.1.6 截屏工具

```shell
sudo pacman -S flameshot
```

#### 5.1.7 壁纸工具

处理壁纸，直接安装即可，在i3配置文件中设置壁纸。

```shell
sudo pacman -S feh
```

### 5.2 音频

#### 5.2.1 spotify

```shell
sudo pacman -S spotify
yay -S spotify-tray-git
```

使用`spotify-tray`来启动`spotify`。并在 i3 中配置 toggle。

#### 5.2.2 easytag

```shell
sudo pacman -S easytag
```

### 5.3 邮件

#### 5.3.1 mutt

```shell
sudo pacman -S mutt
```

Mutt 仅仅只是一个收发邮件的中转站，UNIX 哲学。其配置文件位于`~/.config/mutt/muttrc`：

```shell
chmod 600 ~/.config/mutt/muttrc
```

#### 5.3.2 fetchmail

```shell
sudo pacman -S fetchmail
```

用于收取邮件的软件，其配置文件位于`~/.fetchmailrc`：

```shell
chmod 600 ~/.fetchmailrc
```

#### 5.3.3 procmail

```shell
sudo pacman -S procmail
```

用于存储邮件的软件，其配置文件位于`~/.procmailrc`：

```shell
chmod 600 ~/.procmailrc
```

#### 5.3.4 msmtp

```shell
sudo pacman -S msmtp
```

用于发送邮件的软件，其配置文件位于`~/.mstmtprc`。

### 5.4 视频

#### 5.4.1 播放器

安装 mpv 视频播放器：

```shell
sudo pacman -S mpv
```

#### 5.4.2 录屏软件安装

```shell
sudo pacman -S obs-studio
```

#### 5.4.3 视频剪辑工具

```shell
sudo pacman -S shotcut
```

## 6 云盘

避免折腾，直接使用统一的多协议客户端：

```shell
sudo pacman -S rclone
```

使用的方法参考官网教程。

## 7 其他工具安装

### 7.1 rofi

使用`rofi`作为`dmenu`的替代品。

```shell
sudo pacman -S rofi
```

#### 相关 rofi 工具安装

```sh
sudo pacman -S rofi-greenclip
yay -S rofi-bluetooth-git
yay -S networkmanager-dmenu-git
```

### 7.2 chezmoi 安装

安装 dotfiles 管理工具：

```shell
sudo pacman -S chezmoi
```

对于不需要加密的文件直接 Add 即可，对于需要加密的文件采取`gnome-kerying`的方式保存。

### 7.3 密码管理

```shell
sudo pacman -S gnome-keyring
```

下载 GUI 管理器：

```shell
sudo pacman -S seahorse
```

### 7.4 Github Cli

```shell
sudo pacman -S github-cli
```

#### Copilot Extension

参考[copilot cli](https://docs.github.com/en/copilot/managing-copilot/configure-personal-settings/configuring-github-copilot-in-the-cli)。

### 7.5 stretchly

安装一个定时软件，不能久坐，养身。

```shell
yay -S stretchly-bin
```

### 7.6 Yubikey

公司使用了yubikey，使用下面的命令在ArchLinux上开启yubikey。

```sh
sudo pacman -S yubikey-manager
systemctl enable pcscd.service --now
sudo pacman -S libfido2
```
