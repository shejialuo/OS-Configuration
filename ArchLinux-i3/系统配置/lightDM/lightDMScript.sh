 #!/bin/bash                                                                
xrandr | grep "HDMI-1 disconnected"
result=$?
if [ $result -gt 0 ]
then
    xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 2560x1440     --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-2 --off
else
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate no    rmal --output HDMI-1 --off --output DP-1 --off --output HDMI-2 --off
fi
