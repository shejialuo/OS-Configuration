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

主要记录在Windows配置中的一系列配置过程，并对配置文件进行备份。

主要分为三个部分：

+ 开发环境
+ 系统配置
+ 软件安装
