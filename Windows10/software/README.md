# 软件安装

## 1. 媒体

### 1.1 foobar2000 安装

官网直接下载即可，`.exe`包安装。

#### 1.1.1 foobar2000 皮肤

在`deviantart`下载皮肤[musikarte](https://www.deviantart.com/e-r-i-c/art/musikarte-0-4-1-ENG-and-CHS-270513032)包。（极简主义。）

#### 1.1.2 foobar2000 配置

在`Preference`中的分栏用户界面中的`Colours and Fonts`对字体的大小进行配置。统一为微软雅黑 12pt。

导出配置文件`simple.fcl`。

设置如下的快捷方式（遵循 ArchLinux i3 的设置方式），并设置为 Global Key：

+ `Ctrl+Alt+Up`: Play | Pause toggle.
+ `Ctrl+Alt+Left`: next play.
+ `Ctrl+Alt+Right`: previous play.
+ `Ctrl+Alt+Down`: Always on Top.
+ `Esc`: Hide

### 1.2 Tag 修改器

安装[MP3TAG](https://www.mp3tag.de/en/)。直接便捷式安装即可。

### 1.3 Potplayer 安装

网上直接找资源下载，仍然是便捷式安装。

#### 1.3.1 无边框设置

选择默认皮肤，勾选如下两个选项：

+ 视频下自动隐藏
+ 全屏时防止遮盖

选择图层式皮肤输出：

+ 方式：使用 Direct 3D 9

#### 1.3.2 皮肤安装

直接放在 Potplayer 的 Skin 文件夹就行，本部分文件同步至 Google Drive。

### 1.4 Spotify 下载

切换区域到美国，Microsoft Store 安装。

### 1.5 录屏软件

官网下载`Camtasia studio 2019`。

`C:\ProgramData\TechSmith\Camtasia Studio 19\`修改文件信息，改为只读:

```txt
[RegistrationInfo]
ValidationData3=0
RegistrationKey=DCCMD-8HC7C-M84UU-S4CAV-2253D
RegisteredTo=User
ValidationData1=V8EHCkXlvl|JYXzO
ValidationData2=1
```

## 2. 编辑器

### 2.1 Typora 安装

官网下载安装包即可。

### 2.2 VsCode 安装

官网下载即可，有 GitHub 同步功能。

## 3. 即时通讯软件安装

### 3.1 Telegram 安装

Microsoft Store 安装即可。

### 3.2 QQ 安装

直接下载官方安装包即可。

### 3.3 WeChat 安装

直接下载官方安装包即可。

### 3.4 腾讯会议安装

直接下载官方安装包即可。

## 4. 网盘工具下载

### 4.1 百度云网盘下载

其实我内心是拒绝的，目前暂不下载。

### 4.2 KinhDown 下载

速盘已倒，转战另一家。

### 4.3 OneDrive 下载

微软自带。

### 4.4 Google Drive 下载

用网页版。

## 5. 代理工具安装

### 5.1 Electron SSR 下载

GitHub 下载即可（目前暂时不用）。

### 5.2 Clash for Windows 下载

GitHub 下载即可。配置文件位于`User/.config/clash`。注意`clash for windows`socks 端口和 HTTP 端口一致。

## 6. 实用工具安装

### 6.1 压缩软件下载

下载 7zip，使用命令行处理（与 Linux 同步）。注意添加至环境变量。

### 6.2 命令行下载工具

直接从[GitHub](https://github.com/aria2/aria2)下载，并配置环境变量。

### 6.3 U 盘制作工具

直接官网下载 Rufus，直接安装即可。

## 7. 浏览器安装

### 7.1 Edge dev 下载

与 Linux 保持一致，下载`dev`版，直接官网下载，安装与 Linux 相同的两个插件。目前 Edge 有插件同步功能，很是方便。

## 8. 文档查看器安装

### 8.1 PDF 处理工具

下载 Adobe Acrobat DC

### 8.2 Calibre 安装

官网下载，直接默认安装即可。

### 8.3 Zeal 安装

官网下载，直接默认安装即可。

### 8.4 Pandoc 安装

GitHub 下载即可，添加环境变量。

### 8.5 Goldendict 安装

直接官网下载默认安装。

### 8.6 Zotero 安装

直接官网下载安装。
