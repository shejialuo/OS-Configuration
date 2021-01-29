# 开发环境配置

## 1. Node

官网下载安装包，采用默认安装，安装位置为：`C:\Program Files\nodejs\`。

### 1.1 TypeScript安装

```shell
npm install -g typescript
```

### 1.2 Angular安装

```shell
npm install -g @angular/cli
```

### 1.3 Nest安装

```shell
npm i -g @nestjs/cli
```

## 2. Git安装

官网安装即可，默认安装位置：`C:\Program Files\Git`

## 3. Java安装

下载JDK包，配置环境变量即可，默认安装位置

## 4. Python安装

同上，默认安装位置。

## 5. WSL2安装

教程参考[官方文档](https://docs.microsoft.com/zh-cn/windows/wsl/)。

### 5.1 管理工具

使用[LxRunOffline](https://github.com/DDoSolitary/LxRunOffline)管理WSL。

下载后，加入环境变量即可（位于`D`盘）。

### 5.2 下载ArchLinux

[清华镜像](https://mirrors.tuna.tsinghua.edu.cn/archlinux/iso/latest/)下载`.tar.gz`文件。

### 5.3 安装ArchLinux

```shell
LxRunOffline i -n <自定义名称> -f <Arch镜像位置> -d <安装系统的位置> -r root.x86_64
```

### 5.4 配置ArchLinux

#### 5.4.1 设置为WSL2

```shell
wsl --set-version ArchLinux 2
```

由于端口号冲突，需要解决问题，[参考资料](https://zhuanlan.zhihu.com/p/151392411)

#### 5.4.2 进入ArchLinux

```shell
wsl -d ArchLinux
```

#### 5.4.3 常规配置

```shell
rm /etc/resolv.conf
exit
wsl --shutdown ArchLinux
wsl -d ArchLinux
cd /etc
explorer.exe .
```

找到`pacman.conf`文件，添加`archlinuxcn`源。

后面就是更新软件了，不赘述 。

```shell
pacman -S base base-devel vim git wget
passwd
```

#### 5.4.4 添加用户

```shell
useradd -m -G shejialuo -s /bin/bash shejialuo
passwd shejialuo
vim /etc/sudoers
id - u shejialuo # 获取 <账户id> 
```

然后退出`ArchLinux`，设置普通用户登录ArchLinux。

```shell
lxrunoffline su -n ArchLinux -v <账户id>
```

### 5.5 常用软件

不赘述。

### 5.6 代理设置

`WSL2`的通信机制在于通过本地的windows网关与外部进行通信。很显然需要通过脚本获取DNS网关。

采用`proxychains-ng`进行代理：

#### 5.6.1 设置Win10的防火墙

高级设置，允许`WSL.exe`入站。

#### 5.6.2 通过脚本实现动态获取网关

添加至`.zshrc`。

```shell
export WIN_IP=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`
sed -i '/\[ProxyList\]/,$d' ~/.proxychains.conf
echo '[ProxyList]\nsocks5 '${WIN_IP}' 7890' >> ~/.proxychains.conf
alias pc='proxychains4 -q -f ~/.proxychains.conf'
my_proxy=http://${WIN_IP}:7891
alias p-on='export all_proxy='${my_proxy}' http_proxy='${my_proxy}' https_proxy='${my_proxy}''
alias p-off='unset all_proxy http_proxy https_proxy'
```

### 5.7 VsCode插件

+ Remote-WSL

## 6. vmware 16 安装

安装16进而兼容`hyper-v`。
