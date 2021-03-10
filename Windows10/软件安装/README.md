# 软件安装

## 1. 媒体

### 1.1 foobar2000安装

官网直接下载即可，`.exe`包安装。

#### 1.1.1 foobar2000皮肤

在`deviantart`下载皮肤[musikarte](https://www.deviantart.com/e-r-i-c/art/musikarte-0-4-1-ENG-and-CHS-270513032)包。（极简主义。）

#### 1.1.2 foobar2000配置

在`Preference`中的分栏用户界面中的`Colours and Fonts`对字体的大小进行配置。统一为微软雅黑 12pt。

导出配置文件`simple.fcl`。

设置如下的快捷方式（遵循ArchLinux i3的设置方式），并设置为Global Key：

+ `Ctrl+Alt+Up`: Play | Pause toggle.
+ `Ctrl+Alt+Left`: next play.
+ `Ctrl+Alt+Right`: previous play.
+ `Ctrl+Alt+Down`: Always on Top.
+ `Esc`: Hide

### 1.2 Tag修改器

安装[MP3TAG](https://www.mp3tag.de/en/)。直接便捷式安装即可。

### 1.3 Potplayer安装

网上直接找资源下载，仍然是便捷式安装。

#### 1.3.1 无边框设置

选择默认皮肤，勾选如下两个选项：

+ 视频下自动隐藏
+ 全屏时防止遮盖

选择图层式皮肤输出：

+ 方式：使用Direct 3D 9

#### 1.3.2 皮肤安装

直接放在Potplayer的Skin文件夹就行，本部分文件同步至Google Drive。

### 1.4 Spotify下载

切换区域到美国，Microsoft Store安装。

### 1.5 录屏软件

官网下载`Camtasia studio 2019`。（目前不需要）

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

### 2.1 Vim安装

官网下载安装包。配置参考ArchLinux-i3。不安装任何插件。

### 2.2 Typora安装

官网下载安装包即可。

### 2.3 VsCode安装

官网下载即可，有GitHub同步功能。

## 3. 即时通讯软件安装

### 3.1 Telegram安装

Microsoft Store安装即可。

### 3.2 QQ安装

直接下载官方安装包即可。

### 3.3 WeChat安装

直接下载官方安装包即可。

### 3.4 腾讯会议安装

直接下载官方安装包即可。

## 4. 网盘工具下载

### 4.1 百度云网盘下载

其实我内心是拒绝的，目前暂不下载。

### 4.2 KinhDown下载

速盘已倒，转战另一家。

### 4.3 OneDrive下载

微软自带。

### 4.4 Google Drive下载

用网页版。

## 5. 代理工具安装

### 5.1 Electron SSR下载

GitHub下载即可（目前暂时不用）。

### 5.2 Clash for Windows下载

GitHub下载即可。配置文件位于`User/.config/clash`。注意`clash for windows`socks端口和HTTP端口一致。

## 6. 实用工具安装

### 6.1 压缩软件下载

下载7zip，使用命令行处理（与Linux同步）。注意添加至环境变量。

### 6.2 命令行下载工具

直接从[GitHub](https://github.com/aria2/aria2)下载，并配置环境变量。

### 6.3 U盘制作工具

直接官网下载Rufus，直接安装即可。

## 7. 浏览器安装

### 7.1 Edge dev下载

与Linux保持一致，下载`dev`版，直接官网下载，安装与Linux相同的两个插件。目前Edge有插件同步功能，很是方便。

## 8. 文档查看器安装

### 8.1 PDF处理工具

下载Adobe Acrobat DC

### 8.2 Calibre安装

官网下载，直接默认安装即可。

### 8.3 Zeal安装

官网下载，直接默认安装即可。

### 8.4 Pandoc安装

GitHub下载即可，添加环境变量。

### 8.5 Goldendict安装

直接官网下载默认安装。

### 8.6 Zotero安装

直接官网下载安装。
