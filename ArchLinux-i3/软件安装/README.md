# 软件安装

## 1 实用程序

### 1.1 Zsh安装

直接通过pacman包管理器安装：

```shell
sudo pacman -S zsh
```

#### 1.1.1 安装Oh-My-Zsh

以下过程参考Oh-My-Zsh的GitHub项目主页。

通过`curl`：

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

或者`wget`：

```shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### 1.1.2 安装Powerline字体

```shell
sudo pacman -S powerline-fonts
```

#### 1.1.3 更改终端

在终端输入以下命令：

```shell
chsh -s /bin/zsh
```

重启终端查看是否修改成功：

```shell
echo $SHELL
```

#### 1.1.4 Oh-My-Zsh的配置

本部分主要参考其GitHub项目的Wiki。

##### 1.1.4.1 相关插件下载

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

##### 1.1.4.2 配置

在`.zshrc`中输入以下信息：

```shell
export ZSH="/home/shejialuo/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions web-search autojump zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
alias pc="proxychains4"
alias p-on="export https_proxy=http://127.0.0.1:7890; export http_proxy=http://127.0.0.1:7890"
alias p-off="unset http_proxy https_proxy"
```

### 1.2 终端安装

```shell
sudo pacman -S alacritty
```

### 1.3 文件管理

#### 1.3.1 Pcmanfm安装

安装GUI文件管理器（备用）：

```shell
sudo pacman -S pcmanfm
```

#### 1.3.2 Ranger安装

主程序安装：

```shell
sudo pacman -S ranger
```

##### 1.3.2.1 高亮代码

```shell
sudo pacman -S highlight
```

##### 1.3.2.2 HTML预览

```shell
sudo pacman -S w3m
```

##### 1.3.2.3 Media预览

```shell
sudo pacman -S mediainfo
```

##### 1.3.3.4 图片预览

在`rc.conf`中设置图片预览为`true`即可。

#### 1.3.3 回收站

```shell
sudo pacman -S trash-cli
```

回收站位于`~/.local/share/Trash`。

#### 1.3.4 压缩工具

```shell
sudo pacman -S p7zip
```

#### 1.3.5 设置为默认文件浏览器

[参考资料](https://www.reddit.com/r/ranger/comments/f6b6u7/how_to_open_containing_folder_with_ranger/)

由于原始的`ranger.desktop`文件中存在`Terminal=true`，所以修改为由终端模拟器执行`ranger`:

```shell
cp /usr/share/applications/ranger.desktop ~/.local/share/applications/ranger.desktop
vim ~/.local/share/applications/ranger.desktop
```

改变为以下的值：

```shell
Terminal=false
Exec=Exec=alacritty -e ranger
```

在`mimeapps.list`添加`ranger.desktop`，并更新数据库：

```shell
update-desktop-database ~/.local/share/applications
```

### 1.4 磁盘管理

#### 1.4.1 磁盘清理工具

```shell
sudo pacman -S ncdu
```

### 1.5 系统管理

#### 1.5.1 任务管理

```shell
sudo pacman -S htop
```

#### 1.5.2 系统状态监视

```shell
sudo pacman -S conky
```

#### 1.5.3 系统信息查看

```shell
sudo pacman -S neofetch
```

## 2 输入法安装

### 2.1 Flexible Input Method Framework 5安装

```shell
sudo pacman -S fcitx5
sudo pacman -S fcitx5-qt
sudo pacman -S fcitx5-gtk
```

### 2.2 Fcitx配置工具安装

```shell
sudo pacman -S fcitx5-configtool
```

### 2.3 拼音安装

```shell
sudo pacman -S fcitx5-chinese-addons
```

### 2.4 日语安装

```shell
sudo pacman -S fcitx5-mozc 
```

### 2.5 配置

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

### 2.6 Skin下载

```shell
sudo pacman -S fcitx5-material-color
```

单行模式设置： 在`fcitx5-configtool`中`Addons`中的`pinyin`勾选选项`show preedit within application`。

### 2.7 中文词库下载

```shell
sudo pacman -S fcitx5-pinyin-moegirl
```

## 3 文档与编辑

### 3.1 Typora安装

```shell
sudo pacman -S Typora
```

### 3.2 Gvim安装

`vim`并不能使用系统的剪贴板，安装`gvim`。

```shell
sudo pacman -S gvim
```

配置文件见`.vimrc`。通过`pacman`安装会自动安装到`/usr/share/vim/vimfiles/plugin`。所有的插件均采用`pacman`安装方式，尽可能只采用`pacman`方式安装。

#### 3.2.1 airline插件安装

用于进行状态栏的显示。

```shell
sudo pacman -S vim-airline
```

#### 3.2.2 nerdtree插件安装

用于目录的显示。

```shell
sudo pacman -S vim-nerdtree
```

#### 3.2.3 ale插件安装

异步检查代码。

```shell
sudo pacman -S vim-ale
```

需要自己安装相应的linter。此处请参照开发环境配置。

#### 3.2.4 ctrlp插件安装

使用模糊搜索。

```shell
sudo pacman -S vim-ctrlp
```

#### 3.2.5 nerdcommenter插件安装

快速注释功能:

```shell
sudo pacman -S vim-nerdcommenter
```

#### 3.2.6 surround插件安装

高效操作与括号、引号或html、xml标签相关的配对符号：

```shell
sudo pacman -S vim-surround
```

#### 3.2.7 tagbar插件安装

```shell
sudo pacman -S vim-tagbar
```

#### 3.2.8 wiki插件安装

```shell
yay -S vim-vimwiki
```

### 3.3 VsCode安装

```shell
sudo pacman -S visual-studio-code-bin
```

现在`VsCode`自带同步功能，双系统很方便，直接同步。

### 3.4 Office安装

安装wps office：

```shell
yay -S wps-office
sudo pacman -S ttf-wps-fonts
```

### 3.5 Pandoc安装

安装pandoc：

```shell
sudo pacman -S pandoc
```

### 3.6 Zotero安装

安装Zotero：

```shell
sudo pacman -S zotero
```

### 3.7 Zathura安装

```shell
sudo pacman -S zathura
```

在`~/.config/zathura/zathurarc`中进行配置，以便直接复制到剪贴板：

```shell
set selection-clipboard clipboard
```

#### 3.7.1 安装相关依赖

```shell
sudo pacman -S zathura-pdf-mupdf
```

#### 3.7.2 使用说明

```shell
man zathura
```

### 3.8 Calibre安装

```shell
sudo pacman -S calibre
```

### 3.9 Zeal安装

开发文档查看器：

```shell
sudo pacman -S zeal
```

### 3.10 Goldendict 安装

安装字典：

```shell
sudo pacman -S goldendict
```

注意对词典进行备份。

## 4 网络

### 4.1 代理安装

安装很简单，但是安装后会下载`MMDB`，不跑代理很慢。默认HTTP端口为7890,默认socks端口为7891。必须同步时钟，才能使用（别问我为什么知道，fuck it）。

```shell
sudo pacman -S clash
```

#### 4.2.1 后台运行方式不能自动更新订阅

clash正在运行，可以访问`http://clash.razord.top`。

启动clash，可以直接后台运行，但是不能自动更新配置文件：

```shell
nohup clash > dev/null 2>&1 &
```

#### 4.2.2 服务运行方式自动更新订阅

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

### 4.2 浏览器

#### 4.2.1 Microsoft Edge

Microsoft Edge目前只有dev版本，通过`yay`安装。目前Edge已支持全平台同步：

```shell
yay -S microsoft-edge-dev 
```

安装后登陆微软帐号直接全平台同步，会自动安装插件`SwitchyOmega`，若不能走代理命令行加上参数`--proxy-server="socks5://127.0.0.1:port`。

##### 代理插件安装

直接安装`SwitchyOmega`使用即可，已采用备份。

##### 全键盘操作

安装`Vimium`插件。用法与vim的逻辑十分相似。自定义搜索引擎如下：

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
sudo pacman -S links
sudo pacman -S w3m
```

### 4.3 即使通讯软件

#### 4.3.1 Telegram 安装

```shell
sudo pacman -S telegram-desktop
```

##### 解决无法输入中文问题

找到`/usr/share/applications/telegramdesktop.desktop`文件，在`Exec`行中加入：

```shell
env QT_IM_MODULE=fcitx
```

#### 4.3.2 QQ安装

```shell
sudo pacman -S linuxqq
```

#### 4.3.3 Wechat安装

腾讯为UOS开发了Linux版微信：

```shell
yay -S wechat-uos
```

### 4.4 下载软件

#### 4.4.1 Aria2 安装

下载工具安装：

```shell
sudo pacman -S aria2
```

[配置参考](https://github.com/P3TERX/aria2.conf)

#### 4.4.2 Youtube-dl安装

```shell
sudo pacman -S youtube-dl
```

#### 4.4.3 qbittorrent安装

```shell
sudo pacman -S qbittorrent
```

添加tracer即可。

## 5 媒体

### 5.1 图片

#### 5.1.1 GUI查看器

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

处理壁纸，直接安装即可，在i3配置自动启动加上`--restore`：

```shell
sudo pacman -S nitrogen
```

### 5.2 音频

#### 5.2.1 Spotify安装

```shell
sudo pacman -S spotify
sudo pacman -S spotify-tui
```

#### 5.2.2 Mpd安装

```shell
sudo pacman -S mpd
```

在`~/.config/mpd/mpd.conf`中配置。

##### 5.2.2.1 相关依赖安装

```shell
sudo pacman -S timidity++
```

#### 5.2.3 Ncmpcpp安装

```shell
sudo pacman -S ncmpcpp
```

在文件`~/.config/ncmpcpp/config`配置。

#### 5.2.4 Mpc安装

```shell
sudo pacman -S mpc
```

在文件`~/.config/ncmpcpp/config`配置。

#### 5.2.5 easytag 安装

安装标签编辑工具，虽然ncmpcpp自带编辑tag功能，主要为了添加封面：

```shell
sudo pacman -S easytag
```

### 5.3 邮件

#### 5.3.1 Mutt 安装

```shell
sudo pacman -S mutt
```

Mutt仅仅只是一个收发邮件的中转站，UNIX哲学。其配置文件位于`~/.config/mutt/muttrc`：

```shell
chmod 600 ~/.config/mutt/muttrc
```

#### 5.3.2 Fetchmail 安装

```shell
yay -S fetchmail
```

用于收取邮件的软件，其配置文件位于`~/.fetchmailrc`：

```shell
chmod 600 ~/.fetchmailrc
```

#### 5.3.3 Procmail 安装

```shell
sudo pacman -S procmail
```

用于存储邮件的软件，其配置文件位于`~/.procmailrc`：

```shell
chmod 600 ~/.procmailrc
```

#### 5.3.4 Msmtp 安装

```shell
sudo pacman -S msmtp
```

用于发送邮件的软件，其配置文件位于`~/.mstmtprc`。

### 5.4 视频

#### 5.4.1 播放器

安装mpv视频播放器：

```shell
sudo pacman -S mpv
```

#### 5.4.2 录屏软件安装

```shell
sudo pacman -S simplescreenrecorder
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

### 7.1 Rofi 安装

使用`rofi`作为`dmenu`的替代品。

```shell
sudo pacman -S rofi
```

### 7.2 Drawio 安装

安装矢量图绘制工具：

```shell
sudo pacman -S drawio-desktop-bin
```
