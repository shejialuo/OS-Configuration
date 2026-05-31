# Asahi Linux

[Asahi Linux](asahilinux.org)对于我来说简直就是融通沙漠中的绿洲一般。加上我是M1Pro的芯片，基本上该支持的特性都有，很完善了。

+ [Device Support Overview](https://asahilinux.org/fedora/#device-support)
+ [M1 Series Feature Support](https://asahilinux.org/docs/platform/feature-support/m1/)

## 安装

在macos中运行如下的命令安装：

```sh
curl https://alx.sh | sh
```

基本上所有的配置都可以参考ArchLinux。此处只记录不一样的地方。

## 软件管理

### 软件源

软件源使用清华镜像：

+ [Fedora](https://mirrors.tuna.tsinghua.edu.cn/help/fedora/)
+ [RPMFusion](https://mirrors.tuna.tsinghua.edu.cn/help/rpmfusion)

### 相关软件安装

#### yazi

使用如下命令进行安装：

```sh
dnf copr enable lihaohong/yazi
dnf install yazi --setopt=install_weak_deps=False
```

#### Hyprland

使用[solopasha/hyprland](https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/)，然而这个仓库包含了其他多余的软件，为了避免冲突，在repo文件里面使用白名单模式。

```ini
includepkgs=hyprutils hyprlang hyprcursor aquamarine hyprwire hyprgraphics hyprland xdg-desktop-portal-hyprland hyprpicker hypridle hyprlock hyprtoolkit hyprpaper satty hyprland-guiutils cliphist hyprpolkitagent hyprland-qt-support
```

#### VsCode

参考微软的[官方页面](https://code.visualstudio.com/docs/setup/linux)导入repo。

#### clash

clash仍然是和Archlinux一样，但是无法以用户的方式启动。（set capability会导致go无法优化ARM CPU特性），所以采取了系统服务的方式，这是和Archlinux唯一的区别。

#### Github Releases

有些包得需要自己维护，毕竟不像Archlinux有AUR。

+ [rmpc](https://github.com/mierak/rmpc)
+ [stretchly](https://github.com/hovancik/stretchly)
+ [beancount-language-server](https://github.com/polarmutex/beancount-language-server)
+ [networkmanager_dmenu](https://github.com/firecat53/networkmanager-dmenu)
+ [rofi-bluetooth](https://github.com/nickclyde/rofi-bluetooth)
+ [hyprdynamicmonitors](https://github.com/fiffeek/hyprdynamicmonitors)

其中networkmanager_dmenu和rofi-bluetooth相当稳定，其余的软件更新我自己维护了一个python脚本用于自动化更新。

### 相关脚本

#### 电源管理

```sh
#!/bin/bash

THRESHOLD_PATH="/sys/class/power_supply/macsmc-battery/charge_control_end_threshold"

usage() {
    echo "Usage: mac_charge get|set <threshold>"
    exit 1
}

cmd="${1}"

case "$cmd" in
    get)
        cat "$THRESHOLD_PATH"
        ;;
    set)
        threshold="$2"
        if [[ -z "$threshold" || ! "$threshold" =~ ^[0-9]+$ ]] || ((threshold < 1 || threshold > 100)); then
            echo "Error: threshold must be an integer between 1 and 100"
            exit 1
        fi
        echo "$threshold" | sudo tee "$THRESHOLD_PATH" > /dev/null
        echo "Charge threshold set to ${threshold}%"
        ;;
    *)
        usage
        ;;
esac
```
