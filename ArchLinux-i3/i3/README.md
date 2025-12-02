# i3 配置

主要包含 i3 的基本配置以及 i3bar 的配置：

+ i3-gaps 代替 i3
+ polybar 代替 i3-bar

## 内容

+ Basic configuration
+ Autostart applications
+ Start applications
+ Change focus
+ Move focused window
+ Container layout operation
+ Spotify control
+ To define variables for workspace
+ Workspaces operation
+ i3 operations
+ Container decorations
+ Borders and gaps
+ Start applications on specific workspaces

## 音量控制以及通知

有时候我们希望用键盘去控制音量，然而仅仅只绑定值是不行的，我们希望能使用`dunstify`去通知。在`~/.config/i3`目录下面创建`volume_control.sh`:

```sh
#!/usr/bin/env bash

APP_NAME="i3_volume_control"

case "$1" in
    up)
        pamixer -i 5
        ;;
    down)
        pamixer -d 5
        ;;
    toggle)
        pamixer -t
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac

volume=$(pamixer --get-volume)
is_muted=$(pamixer --get-mute)

if [ "$is_muted" = "true" ]; then
    dunstify -a $APP_NAME -h string:x-dunst-stack-tag:audio -h int:value:$volume -u low -i audio-volume-muted "Volume" "Muted"
else
    if [ "$volume" -le 33 ]; then
        icon=audio-volume-low
    elif [ "$volume" -le 66 ]; then
        icon=audio-volume-medium
    else
        icon=audio-volume-high
    fi
    dunstify -a $APP_NAME -h string:x-dunst-stack-tag:audio -h int:value:$volume -u low -i $icon "Volume" ""
fi
```

然后在i3配置如下：

```config
# To define the volume control script path
set $volume_control ~/.config/i3/volume_control.sh
# To define the keyboard control
bindsym XF86AudioRaiseVolume exec --no-startup-id $volume_control up
bindsym XF86AudioLowerVolume exec --no-startup-id $volume_control down
bindsym XF86AudioMute exec --no-startup-id $volume_control toggle
```

然后在`~/.config/dunst/dunstrc`添加如下内容:

```conf
[i3_volume_control]
    appname = "i3_volume_control"
    history_ignore = yes
    timeout = 2
```

### 亮度控制及通知

亮度控制只使用笔记本，安装`brightnessctl`即可。首先在`~/.config/i3`下面创建`brightness_control.sh`:

```sh
#!/usr/bin/env bash

APP_NAME="i3_brightness_control"

case "$1" in
    up)
        brightnessctl set +5%
        ;;
    down)
        brightnessctl set 5%-
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

BRIGHTNESS_INFO=$(brightnessctl -m)

brightness_percent=$(echo "$BRIGHTNESS_INFO" | awk -F ',' '{print $4}' | tr -d %)

brightness_percent=${brightness_percent:-0}

if [ "$brightness_percent" -le 0 ]; then
    ICON="display-brightness-off-symbolic"
elif [ "$brightness_percent" -le 33 ]; then
    ICON="display-brightness-low-symbolic"
elif [ "$brightness_percent" -le 66 ]; then
    ICON="display-brightness-medium-symbolic"
else
    ICON="display-brightness-high-symbolic"
fi

dunstify -a "$APP_NAME" \
         -h string:x-dunst-stack-tag:brightness \
         -h int:value:"$brightness_percent" \
         -u low \
         -i "$ICON" \
         "Brightness" \
         ""
```

```config
# To define the brightness control script path
set $brightness_control ~/.config/i3/brightness_control.sh
# To define the brightness control
bindsym XF86MonBrightnessDown exec --no-startup-id $brightness_control down
bindsym XF86MonBrightnessUp exec --no-startup-id $brightness_control up
```

然后在`~/.config/dunst/dunstrc`添加如下内容:

```conf
[i3_volume_control]
    appname = "i3_volume_control"
    history_ignore = yes
    timeout = 2
[i3_brightness_control]
    appname = "i3_brightness_control"
    history_ignore = yes
    timeout = 2
```
