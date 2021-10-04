# Windows配置

安装采用Windows To Go。由于Windows To Go默认硬盘脱机，可以采用`diskpart`工具挂载硬盘：

```txt
san
san policy=onlineall
list disk
select disk 1
attributes disk clear readonly
online disk
```

主要通过WSL的Arch Linux部署开发环境。
