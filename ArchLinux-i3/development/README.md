# 开发环境

在该文件安装中的环境，除了`Haskell`以外全部安装在`/`。其余的开发环境应该尽可能地安装在`~/.local/bin`中，保持鲁棒性。

## 1. c and c++

```shell
sudo pacman -S gdb cgdb doxygen
```

```shell
sudo pacman -S gcc
```

```shell
sudo pacman -S valgrind
```

```shell
sudo pacman -S clang
```

```shell
sudo pacman -S libdwarf
```

## 2. go

### 2.1 安装

```shell
sudo pacman -S go
```

## 3. haskell

不采用 ArchLinux 的包管理器，ArchLinux 完全采用动态链接，配置起来并不麻烦，但是错误频繁出现。实在受不了，根据建议，采用`ghcup`进行管理。

### 3.1 ghcup

```shell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

只需要安装 ghcup 安装即可，在`.profile`中添加：

```shell
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
```

### 3.2 安装包

```shell
ghcup tui
```

+ `Stack`
+ `cabal`
+ `HLS`

## 4. python

自带 python2、python3。需要安装以下软件：

### 4.1 包管理器

```shell
sudo pacman -S python-pip
```

注意如果能使用`pacman`包管理器安装软件，一定使用`pacman`包管理器。如果必须使用`pip`，务必加上`--user`，避免安装到`/usr`目录，防止与系统以来出现问题，滚挂了。

### 4.2 代码检查工具

```shell
sudo pacman -S python-pylint
```

## 5. NodeJs

### 5.1 安装

```shell
sudo pacman -S nodejs npm
```

### 5.2 代码检测工具

```shell
sudo pacman -S eslint
```

### 5.3 Angular

```shell
npm install -g @angular/cli
```

### 5.4 NestJs

```shell
sudo npm install -g @nestjs/cli
```

### 5.5 Hexo

```shell
sudo npm install -g hexo-cli
```

### 5.6 Pigco

```shell
sudo npm install picgo -g
```

### 5.7 LanguageServer

```shell
sudo npm install -g sql-language-server
```

## 6. Docker

```shell
sudo pacman -S docker
```

## 7. LaTex

### 7.1 TexLive 安装

```shell
sudo pacman -S texlive-core
```

### 7.2 语言包安装

中文语言包安装：

```shell
sudo pacman -S texlive-langchinese
```

## 8. gnuplot

安装命令行绘图工具：

```shell
sudo pacman -S gnuplot
```

## 9. java scala

```shell
sudo pacman -S jdk11-openjdk scala kotlin
```

## 10. 工具

```shell
sudo pacman -S mysql
sudo pacman -S redis
sudo pacman -S wireshark-cli
yay -S mongodb-bin
sudo pacman -S net-tools dnsutils inetutils
```

