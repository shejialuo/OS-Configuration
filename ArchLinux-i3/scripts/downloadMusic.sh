#!/bin/bash

musicDirectory="/mnt/life/Music"

echo -n "请输入音乐下载的地址: "
read musicLink
echo -n "请输入音乐的名称："
read musicName

aria2c -d "$musicDirectory" -o "$musicName.mp3" "$musicLink"
