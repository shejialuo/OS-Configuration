# Game

折腾如何在ArchLinux上玩Game。主要还是玩一点VN game。

## Steam

主要还是参考[ArchWiki](https://wiki.archlinux.org/title/Steam)

安装首先在`/etc/pacman.conf`中启用 `multilib`仓库。

```sh
sudo pacman -S steam
```

Steam本身有一些直接能在Linux平台原生运行的游戏。但是更多地是通过`proton`进行模拟，可以参考[proton compatibility list](https://www.protondb.com/)。

然后可以通过Steam直接添加non-steam game然后强制使用`proton`模拟，可以玩一些游戏，效果还比较不错。

## Wine

Porton本身就是基于wine的，但是为了更多的环境，还是装一个wine吧。

首先是安装wine本身：

```sh
sudo pacman -S wine wine-mono wine-gecko winetricks
```

使用32位的wine。

```sh
WINEARCH=win32 winecfg
```

### winetricks

```sh
winetricks d3dx9 quartz devenum wmp10 ffdshow gdiplus dotnet40 vcrun6 cjkfonts
```

### 相关驱动

```sh
sudo pacman -S lib32-mesa # video
sudo pacman -S lib32-libpulse # sound
sudo pacman -S lib32-gst-plugins-base lib32-gst-plugins-good # media playback
```

### 映射字体

```sh
cd ${WINEPREFIX:-~/.wine}/drive_c/windows/Fonts && for i in /usr/share/fonts/**/*.{ttf,otf}; do ln -s "$i" ; done
```

### 禁用wine的default application

```sh
rm -f ~/.local/share/applications/wine-extension*.desktop
rm -f ~/.local/share/icons/hicolor/*/*/application-x-wine-extension*
rm -f ~/.local/share/applications/mimeinfo.cache
rm -f ~/.local/share/mime/packages/x-wine*
rm -f ~/.local/share/mime/application/x-wine-extension*
update-desktop-database ~/.local/share/applications
update-mime-database ~/.local/share/mime/
```

### Trouble

OP还是不能正常播放，算了不搞了。没有任何必要。
