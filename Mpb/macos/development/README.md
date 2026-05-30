# 开发

## 1. 更换GNU coreutils

Macos使用的是基于BSD风格的命令，十分不习惯，使用GNU的coreutils。

```sh
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
```

然后使用`oh-my-zsh`的`gnu-utils`插件自动替代掉原有的命令。

## 2. 网络

Macos同样是使用bsd风格的，使用linux风格的。

```sh
brew install iproute2mac
brew install gping
```

## 3. c/c++

mac只自带clang，安装gcc，调试使用lldb。

```sh
brew install gcc@12
cd /opt/homebrew/bin
ln -s gcc-12 gcc
ln -s g++-12 g++
brew install cmake
```

## 4. go

```sh
brew install go
```

## 5. python

自带忽略

## 6. NodeJs

```sh
brew install nodejs
brew install npm
```

## 7. Docker

```sh
brew install docker
```

## 8. gnuplot

```sh
brew install gnuplot
```

## 9. java

```sh
brew install java11
```
