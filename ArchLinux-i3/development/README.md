# 开发环境

## 1. c and c++

```shell
sudo pacman -S gdb doxygen
```

```shell
sudo pacman -S gcc cmake
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

注意如果能使用`pacman`包管理器安装软件，一定使用`pacman`包管理器。如果必须使用`pip`，务必加上`--user`，避免安装到`/usr`目录，防止与系统级别出现问题，滚挂了。

## 5. NodeJs

### 5.1 安装

```shell
sudo pacman -S nodejs npm
```

### 5.2 Hexo

```shell
sudo npm install -g hexo-cli
```

### 5.3 Pigco

```shell
sudo npm install -g picgo
```

## 6. DevOps

仅仅需要Docker。

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

### 7.3 其他包安装

```sh
sudo pacman -S texlive-bibtexextra texlive-latexextra texlive-science texlive-binextra
```

## 8. gnuplot

安装命令行绘图工具：

```shell
sudo pacman -S gnuplot
```

## 9. java

```shell
sudo pacman -S jdk17-openjdk
```

## 10. 工具

```shell
sudo pacman -S net-tools dnsutils inetutils ethtool frpc traceroute
```
