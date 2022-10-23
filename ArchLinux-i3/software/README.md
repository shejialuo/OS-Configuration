# 软件安装

## 1 实用程序

### 1.1 zsh

直接通过 pacman 包管理器安装：

```shell
sudo pacman -S zsh
```

#### 1.1.1 Oh-My-Zsh

以下过程参考 Oh-My-Zsh 的 GitHub 项目主页。

通过`curl`：

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

或者`wget`：

```shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### 1.1.2 安装 powerline 字体

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

#### 1.1.4 Oh-My-Zsh 的配置

本部分主要参考其 GitHub 项目的 Wiki。

##### 1.1.4.1 相关插件下载

+ zsh-syntax-highlighting

  ```shell
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  ```

+ zsh-autosuggestions

  ```shell
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  ```

+ dracula-highlighting

  ```shell
  git clone https://github.com/dracula/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/dracula
  ```

+ autojump

  ```shell
  sudo pacman -S autojump
  ```

##### 1.1.4.2 配置

在`.zshrc`中输入以下信息：

```shell
export ZSH="/home/shejialuo/.oh-my-zsh"
export EDITOR="vim"
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

#### 1.3.1 pcmanfm

安装 GUI 文件管理器（备用）：

```shell
sudo pacman -S pcmanfm
```

#### 1.3.2 ranger

主程序安装：

```shell
sudo pacman -S ranger
```

##### 1.3.2.1 高亮代码

```shell
sudo pacman -S highlight
```

##### 1.3.2.2 HTML 预览

```shell
sudo pacman -S w3m
```

##### 1.3.2.3 Media 预览

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

### 1.6 任务栏安装

使用 polybar

```shell
sudo pacman -S polybar
yay -S ttf-material-design-iconic-font
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

使用`vim`自带的插件管理器进行管理：

+ `~/.install_vim_plugin.sh`
+ `~/.update_vim_plguin.sh`

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

在`~/.config/zathura/zathurarc`中进行配置，以便直接复制到剪贴板：

```shell
set selection-clipboard clipboard
```

#### 安装相关依赖

```shell
sudo pacman -S zathura-pdf-mupdf
```

### 3.7 calibre

```shell
sudo pacman -S calibre
```

### 3.8 zeal

开发文档查看器：

```shell
sudo pacman -S zeal
```

### 3.9 goldendict

安装字典：

```shell
sudo pacman -S goldendict
```

注意对词典进行备份。

### 3.10 xournalpp

目前采用的编辑器基本都是单一的文本，然而有时候需要手动绘图作理解，或者增加一些PDF的批注。xournalpp是一个很好用的工具。

```shell
sudo pacman -S xournalpp
```

## 4 网络

### 4.1 代理安装

安装很简单，但是安装后会下载`MMDB`，不跑代理很慢。默认 HTTP 端口为 7890,默认 socks 端口为 7891。必须同步时钟，才能使用（别问我为什么知道，fuck it）。

由于需要使用premium提供的一些规则故使用premium版蹦，这样就不需要自己写了，有HTTP的方式和FILE的方式，目前clash不支持提供的规则走代理，这样GitHub的文件根本下不下来，所以采用FILE的方式进行，参考别人GitHub Action写了个脚本自己手动更新。

```shell
sudo pacman -S clash-premium-bin
```

```shell
#!/bin/bash

output_dir=./rule/

custom_icloud=https://raw.githubusercontent.com/Loyalsoldier/domain-list-custom/release/icloud.txt
custom_tld_not_cn=https://raw.githubusercontent.com/Loyalsoldier/domain-list-custom/release/tld-!cn.txt
custom_private=https://raw.githubusercontent.com/Loyalsoldier/domain-list-custom/release/private.txt
Loyalsoldier_reject=https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/reject-list.txt
Loyalsoldier_proxy=https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/proxy-list.txt
Loyalsoldier_direct=https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt
Loyalsoldier_gfw=https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/gfw.txt
Loyalsoldier_greatfire=https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/greatfire.txt
felixonmars_apple=https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/apple.china.conf
felixonmars_google=https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/google.china.conf
cn_cidr=https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/cn.txt
lan_cidr=https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/private.txt
telegram_cidr=https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/telegram.txt

generate_icloud() {
  echo "payload:" > icloud.yaml
  curl -sSL ${custom_icloud} | grep -E "^(full|domain):" | awk -F ':' '{printf "  - |+.%s|\n", $2}' | sed "s/|/'/g" >> icloud.yaml
}

generate_google() {
  echo "payload:" > google.yaml
  curl -sSL ${felixonmars_google} | perl -ne '/^server=\/([^\/]+)\// && print "  - |+.$1|\n"' | sed "s/|/'/g" >> google.yaml
}

generate_apple() {
  echo "payload:" > apple.yaml
  curl -sSL ${felixonmars_apple} | perl -ne '/^server=\/([^\/]+)\// && print "  - |+.$1|\n"' | sed "s/|/'/g" >> apple.yaml
}

generate_private() {
  echo "payload:" > private.yaml
  curl -sSL ${custom_private} | awk -F ':' '/^full:/ {printf "  - |%s|\n", $2}' | sed "s/|/'/g" >> private.yaml
  curl -sSL ${custom_private} | awk -F ':' '/^domain:/ {printf "  - |+.%s|\n", $2}' | sed "s/|/'/g" >> private.yaml
}

generate_direct() {
  echo "payload:" > direct.yaml
  curl -sSL ${Loyalsoldier_direct} | grep -Ev "^(regexp|keyword):" | perl -ne '/^(full:)([-_a-zA-Z0-9]+(\.[-_a-zA-Z0-9]+)*)/ && print "  - |$2|\n"' | sed "s/|/'/g" >> direct.yaml
  curl -sSL ${Loyalsoldier_direct} | grep -Ev "^(regexp|keyword|full):" | perl -ne '/^(domain:)?([-_a-zA-Z0-9]+(\.[-_a-zA-Z0-9]+)*)/ && print "  - |+.$2|\n"' | sed "s/|/'/g" >> direct.yaml
}

generate_proxy() {
  echo "payload:" > proxy.yaml
  curl -sSL ${Loyalsoldier_proxy} | grep -Ev "^(regexp|keyword):" | perl -ne '/^(full:)([-_a-zA-Z0-9]+(\.[-_a-zA-Z0-9]+)*)/ && print "  - |$2|\n"' | sed "s/|/'/g" >> proxy.yaml
  curl -sSL ${Loyalsoldier_proxy} | grep -Ev "^(regexp|keyword|full):" | perl -ne '/^(domain:)?([-_a-zA-Z0-9]+(\.[-_a-zA-Z0-9]+)*)/ && print "  - |+.$2|\n"' | sed "s/|/'/g" >> proxy.yaml
}

generate_reject() {
  echo "payload:" > reject.yaml
  curl -sSL ${Loyalsoldier_reject} | grep -Ev "^(regexp|keyword):" | perl -ne '/^(domain:|full:)?([-_a-zA-Z0-9]+(\.[-_a-zA-Z0-9]+)*)/ && print "  - |+.$2|\n"' | sed "s/|/'/g" >> reject.yaml

}

generate_gfw() {
  echo "payload:" > gfw.yaml
  curl -sSL ${Loyalsoldier_gfw} | grep -Ev "^(regexp|keyword):" | perl -ne '/^(domain:|full:)?([-_a-zA-Z0-9]+(\.[-_a-zA-Z0-9]+)*)/ && print "  - |+.$2|\n"' | sed "s/|/'/g" >> gfw.yaml

}

generate_greatfire() {
  echo "payload:" > greatfire.yaml
  curl -sSL ${Loyalsoldier_greatfire} | grep -Ev "^(regexp|keyword):" | perl -ne '/^(domain:|full:)?([-_a-zA-Z0-9]+(\.[-_a-zA-Z0-9]+)*)/ && print "  - |+.$2|\n"' | sed "s/|/'/g" >> greatfire.yaml
}

generate_tld-not-cn() {
  echo "payload:" > tld-not-cn.yaml
  curl -sSL "${custom_tld_not_cn}" | perl -ne '/^domain:([-_a-zA-Z0-9]+(\.[-_a-zA-Z0-9]+)*)/ && print "  - |+.$1|\n"' | sed "s/|/'/g" >> tld-not-cn.yaml
}

generate_cncidr() {
  echo "payload:" > cncidr.yaml
  curl -sSL ${cn_cidr} | perl -ne '/(.+\/\d+)/ && print "  - |$1|\n"' | sed "s/|/'/g" >> cncidr.yaml
}

generate_telegramcidr() {
  echo "payload:" > telegramcidr.yaml
  curl -sSL ${telegram_cidr} | perl -ne '/(.+\/\d+)/ && print "  - |$1|\n"' | sed "s/|/'/g" >> telegramcidr.yaml
}

generate_lancidr() {
  echo "payload:" > lancidr.yaml
  curl -sSL ${lan_cidr} | perl -ne '/(.+\/\d+)/ && print "  - |$1|\n"' | sed "s/|/'/g" >> lancidr.yaml
}

main() {
  if [[ ! -d  ${output_dir} ]]; then
    mkdir ${output_dir}
  fi
  cd ${output_dir}
  generate_icloud
  generate_google
  generate_apple
  generate_private
  generate_direct
  generate_proxy
  generate_reject
  generate_gfw
  generate_greatfire
  generate_tld-not-cn
  generate_cncidr
  generate_telegramcidr
  generate_lancidr
}

main
```

#### 4.2.1 后台运行方式不能自动更新订阅

clash 正在运行，可以访问`https://clash.razord.top`。

启动 clash，可以直接后台运行，但是不能自动更新配置文件：

```shell
nohup clash > dev/null 2>&1 &
```

#### 4.2.2 服务运行方式自动更新订阅

由于后台运行的方式无法实现订阅的自动更新，将 clash 封装成服务，每次启动时进行一次更新。新建文件`/usr/lib/systemd/system/clash.service`:

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
WantedBy=multi-user.target
```

`start-clash.sh`和`stop-clash.sh`见文件，注意权限。

可以直接使用`systemctl start clash --user`从而不更新代理。

### 4.2 浏览器

#### 4.2.1 Microsoft Edge

Microsoft Edge 目前只有 dev 版本，通过`yay`安装。目前 Edge 已支持全平台同步：

```shell
yay -S microsoft-edge-dev-bin
```

安装后登陆微软帐号直接全平台同步，会自动安装插件`SwitchyOmega`，若不能走代理命令行加上参数`--proxy-server="socks5://127.0.0.1:port`。

##### 代理插件安装

直接安装`SwitchyOmega`使用即可，已采用备份。

Microsoft Edge dev for Linux 存在不联网就会直接 crash 的[bug](https://techcommunity.microsoft.com/t5/discussions/edge-dev-crashing-at-start-up-in-linux/m-p/2629267)，校园网可以采取 ipv6 进行免流，但是如果不让 Microsoft Edge 走代理，会直接 crash，故通过编辑本地`.desktop`文件，添加代理的环境变量即可。

+ `mod + F2`： 启动 Edge，不添加环境变量。
+ `rofi`： 启动 Edge，添加环境变量。

~~Fuck it~~

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

### 4.4 下载软件

#### 4.4.1 Aria2 安装

下载工具安装：

```shell
sudo pacman -S aria2
```

[配置参考](https://github.com/P3TERX/aria2.conf)

#### 4.4.2 Youtube-dl 安装

```shell
sudo pacman -S youtube-dl
```

#### 4.4.3 qbittorrent 安装

```shell
sudo pacman -S qbittorrent
```

添加 tracer 即可。

#### 4.4.4 局域网文件分享

```shell
sudo pacman -S nitroshare
```

### 4.5 RSS

```shell
sudo pacman -S newsboat
```

### 4.6 终端代理工具

```shell
sudo pacman -S proxychains-ng
```

### 4.7 热点

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

### 4.8 远程桌面

#### 4.8.1 rdp协议

```shell
sudo pacman -S freerdp
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

处理壁纸，直接安装即可，在 i3 配置自动启动加上`--restore`：

```shell
sudo pacman -S nitrogen
```

### 5.2 音频

#### 5.2.1 spotify

```shell
sudo pacman -S spotify
yay -S spotify-tray-git
```

使用`spotify-tray`来启动`spotify`。并在 i3 中配置 toggle。

#### 5.2.2 mpd

```shell
sudo pacman -S mpd
```

在`~/.config/mpd/mpd.conf`中配置。

##### 5.2.2.1 相关依赖

```shell
sudo pacman -S timidity++
```

#### 5.2.3 ncmpcpp

```shell
sudo pacman -S ncmpcpp
```

在文件`~/.config/ncmpcpp/config`配置。

#### 5.2.4 mpc

```shell
sudo pacman -S mpc
```

#### 5.2.5 easytag

安装标签编辑工具，虽然 ncmpcpp 自带编辑 tag 功能，主要为了添加封面：

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

### 7.1 rofi

使用`rofi`作为`dmenu`的替代品，使用[Dracula 主题](https://draculatheme.com/rofi)。

```shell
sudo pacman -S rofi
```

#### 相关 rofi 工具安装

```sh
sudo pacman -S rofi-greenclip
yay -S rofi-bluetooth-git
yay -S networkmanager-dmenu-git
```

### 7.2 drawio

安装矢量图绘制工具：

```shell
sudo pacman -S drawio-desktop-bin
```

### 7.3 chezmoi 安装

安装 dotfiles 管理工具：

```shell
sudo pacman -S chezmoi
```

对于不需要加密的文件直接 Add 即可，对于需要加密的文件采取`gnome-kerying`的方式保存。

### 7.4 密码管理

```shell
sudo pacman -S gnome-keyring
```

下载 GUI 管理器：

```shell
sudo pacman -S seahorse
```

### 7.5 多显示器管理

```shell
sudo pacman -S arandr
```

### 7.6 Github Cli

```shell
sudo pacman -S github-cli
```

### 7.7 Kdeconnect

Ios 终于支持 kdeconnect 了。

```shell
sudo pacman -S kdeconnect
```

### 7.8 stretchly

安装一个定时软件，不能久坐，养身。

```shell
yay -S stretchly-bin
```

### 7.9 tmux

还是用一下`tmux`吧，主要还是服务器端使用多，顺便练习一下，过于依赖i3了。

```sh
sudo pacman -S tmux
```

### 7.10 Remote Desktop

因为疫情等各方面，不想只ssh过来，有时候也想用远程桌面，故部署远程桌面的环境。

```sh
yay -S rdp
```

注意需要使用`.xinitrc`文件。
