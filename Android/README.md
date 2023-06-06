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

### 去广告

~~结合Magisk自带Systemless Hosts以及[AdAway](https://github.com/AdAway/AdAway)使用，不需要使用vpn，避免和clash冲突。本质也是修改hosts，还是root的方式更加轻量。~~

~~然而问题在于`hosts`文件不能过长，由于Linux查找映射是顺序查找的，解析dns就会相当慢。所以最合适的方式是应该是只保留官方的几千条hosts，加一些常见的即可。过长不适合。参考[ADhosts](https://github.com/otobtc/ADhosts)。过于折腾。~~

突然反思，有必要这么复杂吗？实际上安卓上比起苹果最不好的就是没有url rewriter的功能。不能做中间人攻击，还是思考通过clash把广告屏蔽呢？这或许才是最简单的方法。

实际上去广告最合适的还是使用好软件。没有净土。

## 录音功能

安装[GAppsMod](https://github.com/jacopotediosi/GAppsMod)，设置好了可以直接删除，其通过修改数据库更改信息，完美。

## NFC

购买NFC卡模拟器进行IC卡模拟，ID卡就别指望了，请支持正版，也不贵。

## 相机

原生的相机过于丑陋，安装[GCam](https://www.celsoazevedo.com/)和Google图库，简单。

## 其他

其他就是一些常规操作了。Enjoy Android
