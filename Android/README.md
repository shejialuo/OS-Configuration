# Android

最近打算双持，购买了Xiaomi 13，至于购买的原因：

1. 小屏且屏幕素质过关，小屏的安卓手机几乎没有选了，选择小米13属于是无奈之举。
2. 有比较好的[类原生ROM](https://paranoidandroid.co/)。
3. 苹果的手机极其无趣，选择苹果只因为是小屏手机。

## 1. 类原生刷机

### 1.1 原理

刷机的原理很简单，如果你会使用Linux，你也就能够明白安卓，当然安卓肯定有许多魔改，但是理念是不会改变的。我刷机的工作都是在ArchLinux上完成的，先下载必要的包。

```sh
yay -S android-sdk-platform-tools
```

### 1.2 原生包处理

首先需要解锁bl（我到手的时候已经是Hyper OS了，用了点[小手段](https://github.com/MlgmXyysd/Xiaomi-HyperOS-BootLoader-Bypass)），类似PC机的bios。刷机的流程如下：

```sh
# 进入recovery模式，update firmware。（我选择的是Global OS1.0.6.0.UMCMIXM）
sudo adb sideload ./fw_fuxi_miui_FUXIGlobal_OS1.0.6.0.UMCMIXM_160365d42d_14.0.zip

# 进入fastboot直接线刷
sudo fastboot update ./aospa-uvite-beta-fuxi-20240904-image.zip
```

### 1.3 Root权限 (Magisk)

原生有很多麻烦的事情，比如说指纹支付就是一个痛点。所以需要刷入Magisk等模块，本质上就是获得Root权限？（不懂其基本原理）。刷入官方有详细的教程，参考官方教程即可。

#### 隐藏Root

+ 在`Magisk`设置中开启`Zygisk`。
+ 然后安装模块[Shamiko](https://github.com/LSPosed/LSPosed.github.io/releases)。
+ 通过`Magisk`的设置中的`配置排除列表`排除某些应用的Root，以便正常使用该类软件。

#### 指纹支付

安装模块[FingerprintPay](https://github.com/eritpchy/FingerprintPay)。

#### 补全字重

安装模块[notocjk](https://github.com/simonsmh/notocjk)

#### 去广告

~~结合Magisk自带Systemless Hosts以及[AdAway](https://github.com/AdAway/AdAway)使用，不需要使用vpn，避免和clash冲突。本质也是修改hosts，还是root的方式更加轻量。~~

~~然而问题在于`hosts`文件不能过长，由于Linux查找映射是顺序查找的，解析dns就会相当慢。所以最合适的方式是应该是只保留官方的几千条hosts，加一些常见的即可。过长不适合。参考[ADhosts](https://github.com/otobtc/ADhosts)。过于折腾。~~

突然反思，有必要这么复杂吗？实际上安卓上比起苹果最不好的就是没有url rewriter的功能。不能做中间人攻击，还是思考通过clash把广告屏蔽呢？这或许才是最简单的方法。

实际上去广告最合适的还是使用好软件。没有净土。

#### 录音功能

安装[GAppsMod](https://github.com/jacopotediosi/GAppsMod)，设置好了可以直接删除，其通过修改数据库更改信息，完美。

#### 词库

安装[CustomPinyinDictionary](https://github.com/wuhgit/CustomPinyinDictionary).

#### NFC

购买NFC卡模拟器（google play）进行IC卡模拟，ID卡就别指望了，请支持正版，也不贵。

## 2. 软件

### 2.1 F-Droid 第三方客户端

[Driod-ify](https://github.com/Iamlooker/Droid-ify)

### 2.2 即使通讯软件

#### Telegram

Google play安装即可。使用主题[dracula](https://github.com/dracula/telegram-android)。

#### IRC

安装[Goguma](https://git.sr.ht/~emersion/goguma)。

#### 其他

+ 微信
+ QQ
+ Slack
+ Teams

### 2.3 音乐

+ Spotify: 流媒体播放器
+ Retro: 本地音乐播放器

### 2.4 视频

### 2.5 文档

+ 邮件: Outlook，从google play下载。
+ RSS阅读器: [Feeder](https://github.com/spacecowboy/Feeder)
