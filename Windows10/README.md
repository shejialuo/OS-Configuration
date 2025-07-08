# Windows 配置

目前Windows基本用来打游戏了，仍然保留采用[bug.n](https://github.com/fuhsjr00/bug.n)作为平铺式桌面的配置，参考[配置文件](./bug_dot_n/Config.ini)。

## 安装Windows 11 LSTC版本

从[windows_ltsc_links](https://massgrave.dev/windows_ltsc_links)安装。然而LSTC版本不带Windows Store，很不方便。在`Powershell`中使用如下的命令：

```powershell
wsreset -i
```

等待一下，Microsoft store就会自动出现，然后安装Windows官方的包管理器`winget`.

## 代理安装

参考ArchLinux的配置，使用CFW。

## Terminal 安装

从官网下载，使用[dracula主题](https://draculatheme.com/windows-terminal)。

## 字体

只需要安装一个编程字体[Fira Code](https://github.com/tonsky/FiraCode)。

## 终端代理

打开powershell，

```
notepad $PROFILE
```

输入如下的内容：

```powershell
function p-on {$env:HTTP_PROXY="http://127.0.0.1:7890";$env:HTTPS_PROXY="http://127.0.0.1:7890"}
function p-off {del env:HTTP_PROXY; del env:HTTPS_PROXY}
```

## 文档办公

+ 大学买笔记本的时候送了正版的2016 office，直接在微软官网里面下载即可。

## 软件安装

我几乎只在Windows上娱乐，不会配置很复杂的开发环境。

+ Powersell 7: `winget install --id Microsoft.PowerShell --source winget`
+ Git: `winget install --id Git.Git --source winget`
+ notepad3: `winget install --id Rizonesoft.Notepad3 --source winget`
+ Vscode: `winget install --id Microsoft.VisualStudioCode --source winget`
+ Telegram: `winget install --id Telegram.TelegramDesktop --source winget`
+ QQ: `winget install --id Tencent.QQ.NT --source winget`
+ Wechat: `winget install --id Tencent.WeChat --source winget`
+ Pandoc: `winget install --id JohnMacFarlane.Pandoc --source winget`
+ Keepassxc: `winget install --id KeePassXCTeam.KeePassXC --source winget`
+ Python3: `winget install --id Python.Python.3.12 --source winget`
+ Steam: `winget install --id Valve.Steam --source winget`
+ Rufus: `winget install --id Rufus.Rufus --source winget`
+ Zotero: `winget install --id DigitalScholar.Zotero --source winget`
+ 百度网盘：`winget install --id Baidu.BaiduNetdisk --source winget`

自动更新很简单：

```powershell
winget upgrade
```

## 游戏

+ 军旗辅助工具
+ WeGame：官网下载，被腾讯折磨。
