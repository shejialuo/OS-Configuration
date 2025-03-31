# 系统配置

## 1. HomeBrew包管理安装

参照[清华镜像使用说明](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/)进行安装，通过环境变量的方式使用镜像，在`~/.zshrc`中设置好两个别名用于开启镜像和关闭镜像。

+ `brew-on`.
+ `brew-off`.

## 2. 安装监控器

直接在bar上安装stats用于展示当前cpu的系统资源的消耗。stats提供了相应的设置，直接进行GUI设置。

```sh
brew install stats
```

## 3. macos手势

直接在系统中设置即可。

## 4. 快捷键设置

~~我本来想首先互换`control`键和`command`键，但是我最后放弃了因为这对于mac来说，是根本无法实现的，因为终端的操作基本都涉及到ctrl，这样我终端的快捷使用又会不一致，我无语了~~。

迫不得已，我使用`ctrl`键作为自定义的键，然后根据ArchLinux i3wm设置如下的快捷键：

+ `ctrl <num>`: 移动到特定的桌面。
+ `ctrl <-(->)`: 进行桌面已经全屏应用之间的移动。
+ `ctrl m`: 打开/关闭程序坞。
+ `ctrl n`: 打开通知中心。
+ `ctrl p`: 截屏。
+ `ctrl <uparrow>`: 调度中心。
+ `ctrl <downarrow>`: 应用程序窗口。

剩下的快捷键就直接随缘了吧。

## 5. Launcher

使用启动台对于快速启动很不方便，苹果自带聚焦功能，然而极其消耗CPU资源。使用sol，同时也解决了剪贴板等问题。

+ 剪贴板记录：`command + shift + v`
+ 移动窗口：`ctrl + option + arrow/enter`
