# 系统配置

## 1. 约定

+ 软件安装包的位置：默认位置。
+ 软件缓存的位置：`C:\Cache`。

注意，软件缓存的位置只能随缘，看软件支不支持。

## 2. UWP

+ Windows Terminal
+ Microsoft TODO
+ TranslucentTB
+ Spotify (换区下载)

## 3. Windows Terminal配置

### 3.1 安装 PowerShell7

GitHub下载。

### 3.2 美化 PowerShell

使用类似的 Posh-Git 和 Oh-My-Posh:

```shell
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
```

打开 PowerShell 的配置文件：

```shell
notepad $PROFILE
```

添加以下内容:

```shell
Import-Module posh-git 
Import-Module oh-my-posh 
Set-Theme Agnoster
```

此处需要注意，如果使用的是oh-my-posh版本3，需要更改最后一句命令：

```shell
# Set-Theme Agnoster
Set-PoshPrompt -Theme agnoster 
```

### 3.3 PSReadLine 的使用

仍是在PowerShell的配置文件中输入，即可实现在Menu补全:

```shell
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
```

### 3.4 配置文件

由于oh-my-posh的更新，使得Fira Code字体使用体验下降（图标原因），故换为官方推荐的字体，见`settings.json`。

同时需要更改VsCode Terminal的字体配置进而正常显示。

## 4. VsCode

直接下载安装即可，有同步功能，详细插件见Linux部分。

## 5. Vs2019

下载安装即可。

## 6. Win10常用快捷键

记录一些自己不知道且有价值的快捷键。

### 6.1 虚拟桌面控制

+ `Windows + Ctrl + F4`: Close the virtual desktop.

### 6.2 常用操作

+ `Windows + L`: Lock
+ `F2`: mv
+ `F3`: 在文件资源管理器中搜索文件或文件夹
+ `F4`: 在文件资源管理器中显示地址栏列表
+ `F6`: 在窗口中或桌面上循环浏览屏幕元素
+ `Ctrl + D`: Delete
+ `Ctrl + R`: Reload

### 6.3 Windows 徽标键键盘快捷方式

+ `Windows + B`: 将焦点设置到通知区域
+ `Windows + I`: 打开“设置”
+ `Windows + M`: 最小化所有窗口
+ `Windows + ,`: 临时快速查看桌面
+ `Windows + +(-)`: 加号 (+) 或减号 (-) 使用“放大镜”放大或缩小
+ `Windows + Esc`: 退出“放大镜”
