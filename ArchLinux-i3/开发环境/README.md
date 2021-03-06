# 开发环境

## 1. C and C++

```shell
sudo pacman -S gdb
```

```shell
sudo pacman -S gcc
```

```shell
sudo pacman -S valgrind
```

## 2. Go

### 2.1 安装

```shell
sudo pacman -S go
```

## 3. Haskell

不采用ArchLinux的包管理器，ArchLinux完全采用动态链接，配置起来并不麻烦，但是错误频繁出现。实在受不了，根据建议，采用`ghcup`进行管理。

### 3.1 ghcup安装

```shell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

只需要安装ghcup安装即可，在`.profile`中添加：

```shell
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
```

### 3.2 ghc安装

```shell
ghcup install ghc
```

### 3.3 cabal安装

```shell
ghcup install cabal
```

使用说明详见[官方文档](https://cabal.readthedocs.io)

## 4. Python

自带Python2、python3。需要安装以下软件：

### 4.1 Python包管理器

```shell
sudo pacman -S python-pip
```

注意如果能使用`pacman`包管理器安装软件，一定使用`pacman`包管理器。如果必须使用`pip`，务必加上`--user`，避免安装到`/usr`目录，防止与系统以来出现问题，滚挂了。

### 4.2 Python代码检查工具

```shell
sudo pacman -S python-pylint
```

### 4.3 PythonGObject安装

```shell
sudo pacman -S python-gobject
```

## 5 NodeJs

### 5.1 安装

```shell
sudo pacman -S nodejs
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

## 6 Docker

```shell
sudo pacman -S docker
```

## 7 LaTex

### 7.1 TexLive安装

```shell
sudo pacman -S  texlive-core
```

### 7.2 语言包安装

中文语言包安装：

```shell
sudo pacman -S texlive-langchinese
```

### 7.3 结合VSCode编写

插件的使用参见[官方wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki)

#### 7.3.1 外置PDF阅读

结合Zathura：

```json
"latex-workshop.view.pdf.viewer": "external",
"latex-workshop.view.pdf.external.viewer.command": "zathura",
"latex-workshop.view.pdf.external.viewer.args": [
    "--synctex-editor-command",
    "code --reuse-window -g \"%{input}:%{line}\"",
    "%PDF%"
],
"latex-workshop.view.pdf.external.synctex.command": "zathura",
"latex-workshop.view.pdf.external.synctex.args": [
    "--synctex-forward=%LINE%:0:%TEX%",
    "%PDF%"
],
```

## 8 gnuplot

安装命令行绘图工具：

```shell
sudo pacman -S gnuplot
```
