# Windows 配置

安装采用 Windows To Go。由于 Windows To Go 默认硬盘脱机，可以采用`diskpart`工具挂载硬盘：

```txt
san
san policy=onlineall
list disk
select disk 1
attributes disk clear readonly
online disk
```

主要通过 WSL 的 Arch Linux 部署开发环境。
