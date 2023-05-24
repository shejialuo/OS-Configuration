# Android

最近抛弃了苹果生态，完全使用安卓，购买了Redmi K40S。为什么购买这款机型，因为Arrow OS类原生官方支持。

## 原理

刷机的原理很简单，如果你会使用Linux，你也就能够明白安卓，当然安卓肯定有许多魔改，但是理念是不会改变的。我刷机的工作都是在ArchLinux上完成的，先下载必要的包。

```sh
sudo pacman -S android-sdk-platform-tools
```

## 刷机

首先需要解锁bl，类似PC机的bios。首先需要下载`twrp`的image，然后使用`fastboot`命令直接启动该镜像。

```sh
sudo fastboot boot ./twrp-3.7.0_12-0-munch.img # 别在乎名字
```

进入了`twrp`的界面，首先格式化`data`分区，然后开启`Apply from ADB`。

```sh
sudo adb sideload ./much.zip # 别在乎名字
```

搞定。个人认为是相当简单的刷机过程，没有任何难度。说白了基本原理就是Linux系统的安装过程。一般来说Linux系统安装可以通过U盘先启动一个基本的系统进行安装，`twrp`就是一个最简单的安卓系统。

## Root权限

原生有很多麻烦的事情，比如说指纹支付就是一个痛点。所以需要刷入Magisk等模块，本质上就是获得Root权限？（不懂其基本原理）。刷入官方有详细的教程，然而我找不到`boot.img`，于是用笨方法。

首先从GitHub下载Magisk的apk，修改后缀为zip，即`Magisk.zip`。重复刷机的步骤即可。

```sh
sudo fastboot boot ./twrp-3.7.0_12-0-munch.img
sudo adb sideload ./Magisk.zip
```

搞定了Magisk模块，从而获得了Root权限。（很简单）

### 隐藏Root

+ 在`Magisk`设置中开启`Zygisk`。
+ 然后安装模块[Shamiko](https://github.com/LSPosed/LSPosed.github.io/releases)。
+ 通过`Magisk`的设置中的`配置排除列表`排除某些应用的Root，以便正常使用该类软件。

### 指纹支付

安装模块[FingerprintPay](https://github.com/eritpchy/FingerprintPay)。

### 补全字重

安装模块[notocjk](https://github.com/simonsmh/notocjk)

### 电池管理

安装模块[acc](https://github.com/VR-25/acc)和模块[djs](https://github.com/VR-25/djs)

使用[AccA](https://github.com/MatteCarra/AccA)作为这两个模块的前端。

## 录音功能

安装[GAppsMod](https://github.com/jacopotediosi/GAppsMod)，设置好了可以直接删除，其通过修改数据库更改信息，完美。

## 其他

其他就是一些常规操作了。Enjoy Android
