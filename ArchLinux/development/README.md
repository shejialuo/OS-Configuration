# 开发环境

## 1. c and c++

```sh
sudo pacman -S gdb doxygen
```

```sh
sudo pacman -S gcc cmake
```

```sh
sudo pacman -S valgrind
```

```sh
sudo pacman -S clang
```

```sh
sudo pacman -S libdwarf
```

## 2. go

### 2.1 安装

```sh
sudo pacman -S go
```

## 3. haskell

不采用 ArchLinux 的包管理器，ArchLinux 完全采用动态链接，配置起来并不麻烦，但是错误频繁出现。实在受不了，根据建议，采用`ghcup`进行管理。

### 3.1 ghcup

```sh
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

只需要安装 ghcup 安装即可，在`.profile`中添加：

```sh
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
```

### 3.2 安装包

```sh
ghcup tui
```

+ `Stack`
+ `cabal`
+ `HLS`

## 4. python

自带python3。需要安装以下软件：

### 4.1 包管理器

```sh
sudo pacman -S python-pip
```

注意如果能使用`pacman`包管理器安装软件，一定使用`pacman`包管理器。如果必须使用`pip`，务必加上`--user`，避免安装到`/usr`目录，防止与系统级别出现问题，滚挂了。

### 4.2 依赖管理工具安装

`pipx`是专门给命令行工具用的安装器，每个工具都装在独立的虚拟环境里，但命令全局可用。然后安装`pdm`用于管理python项目。

```sh
sudo pacman -S python-pipx
pipx install pdm
```

### 4.3 IDE配套工具安装

```sh
sudo pacman -S pyright
pipx install black isort
pipx install compiledb
```

## 5. NodeJs

### 5.1 安装

```sh
sudo pacman -S nodejs npm
```

### 5.2 Hexo

```sh
sudo npm install -g hexo-cli
```

### 5.3 Pigco

```sh
sudo npm install -g picgo
```

## 6. DevOps

仅仅需要Docker。

```sh
sudo pacman -S docker
```

## 7. LaTex

### 7.1 TexLive 安装

```sh
sudo pacman -S texlive-core
```

### 7.2 语言包安装

中文语言包安装：

```sh
sudo pacman -S texlive-langchinese
```

### 7.3 其他包安装

```sh
sudo pacman -S texlive-bibtexextra texlive-latexextra texlive-science texlive-binextra
```

## 8. gnuplot

安装命令行绘图工具：

```sh
sudo pacman -S gnuplot
```

## 9. java

```sh
sudo pacman -S jdk17-openjdk
```

## 10. beancount

```sh
sudo pacman -S beancount beancount-language-server
```

## 11. rust

```sh
sudo pacman -S rust cargo rust-analyzer
```

## 12. bash

```sh
sudo pacman -S bash-language-server
```

## 13. 工具

```sh
sudo pacman -S net-tools dnsutils inetutils ethtool frpc traceroute
```
