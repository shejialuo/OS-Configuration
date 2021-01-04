# 1. 约定

+ 软件安装包的位置：`F:\Software`。
+ 软件缓存的位置：`F:\Cache`。
+ 游戏位于的盘：`E:\`。
+ OneDrive文件夹：`G:\onedrive`

注意，软件缓存的位置只能随缘，看软件支不支持。

# 2. UWP

为了确保独立性，UWP应用均保存在`G`盘。

+ Windows Terminal 
+ 哔哩哔哩动画
+ Microsoft TODO
+ TranslucentTB （必须安装在C盘）
+ NVDIA Control Panel （必须安装在C盘）

# 3. Windows Terminal配置

## 3.1 安装 PowerShell7

GitHub下载。

## 3.2 美化 PowerShell

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

## 3.3 PSReadLine 的使用

仍是在PowerShell的配置文件中输入，即可实现在Menu补全:

```shell
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
```

## 3.4 配置文件

见`settings.json`。


# 4. VsCode


# 5. Vs2020



