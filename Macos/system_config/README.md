# 系统配置

## 1. HomeBrew包管理安装

参照[清华镜像使用说明](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/)进行安装，通过环境变量的方式使用镜像，在`~/.zshrc`中设置好两个别名用于开启镜像和关闭镜像。

+ `brew-on`.
+ `brew-off`.

## 2. 平铺桌面管理器安装

+ [aerospace](https://github.com/nikitabobko/AeroSpace)
+ [sketchybar](https://github.com/FelixKratz/SketchyBar)

```sh
brew install aerospace sketchybar
```

## 3. 快捷键设置

+ `ctrl n`: 打开通知中心。
+ `ctrl p`: 截屏。

## 4. Launcher

使用启动台对于快速启动很不方便，苹果自带聚焦功能，然而极其消耗CPU资源。安装[sol](https://github.com/ospfranco/sol)，同时也解决了剪贴板等问题。

```sh
brew install sol
```

+ 启动美好：`alt + <space>`
+ 剪贴板记录：`alt + c`
+ lock: `alt + l`
