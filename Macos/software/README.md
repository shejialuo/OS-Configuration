# 软件安装

## 1. 实用工具

### 1.1 Terminal & Shell

#### 1.1.1 zsh

macos已经自带了zsh，不需要额外安装。

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

#### 1.1.2 终端安装

```sh
brew install kitty tmux
```

#### 1.1.3 其他命令行工具

```sh
brew install fzf zoxide bat fd ripgrep
```

### 1.2 文件管理

类似ArchLinux使用`yazi`。

```sh
brew install highlight
brew install mediainfo
brew install trash-cli
brew install p7zip
brew install ncdu
brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font
```

### 1.3 系统管理

```sh
brew install htop
```

## 2. 文档与编辑

### 2.1 VsCode

```sh
brew install visual-studio-code
```

### 2.2 Office

直接使用google docs并结合wpsoffice使用，office轻度用户。

```sh
brew install wpsoffice
```

### 2.3 pandoc

```sh
brew install pandoc
```

### 2.4 zotero

```sh
brew install zotero
```

### 2.5 zathura

macos有zathura直接曲线救国一波，参考

+ [安装zathura](https://github.com/zegervdv/homebrew-zathura)
+ [使用zathura作为默认的pdf阅读器](https://gist.github.com/agzam/76d761804330cc8c4600fccda952ed1c)

## 3. 网络

### 3.1 代理

安装clashXPro.

### 3.2 浏览器

```sh
brew install microsoft-edge
```

### 3.3 即时通讯软件

#### 3.3.1 Telegram

```sh
brew install telegram-desktop
```

#### 3.3.2 qq

```sh
brew install qq
```

#### 3.3.3 微信

```sh
brew install wechat
```

### 3.4 下载软件

#### 3.4.1 aria2

```sh
brew install aria2
```

#### 3.4.2 qbittorrent

```sh
brew install qbittorrent
```

## 4. 媒体

### 4.1 图片

#### 4.1 图片处理工具

```sh
brew install imagemagick
```

#### 4.2 图片压缩工具

```sh
brew install guetzli
```

### 4.2 音频

#### 4.2.1 spotify

```sh
brew install spotify
```

### 4.3 邮件

使用Mutt，采用和ArchLinux一样的配置。

### 4.4 视频

#### 4.4.1 播放器

安装mpv播放器。

```sh
brew install mpv
```

#### 4.4.2 推流和录制

```sh
brew install obs
```

### 4.5 图书

```sh
brew install calibre
```

## 5. 云盘

由于`rclone`需要挂载，只能从Github中安装。
