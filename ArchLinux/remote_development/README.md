# 远程开发

在家也想使用实验室的主机进行远程开发，不打算使用任何桌面环境。所有开发通过`tmux + vim`以及命令行的方式进行。不想使用VsCode的`Remote-SSH`，过于麻烦，使用最简单的方式。

## 内网穿透

内网穿透相当的简单，直接使用开源工具[frp](https://github.com/fatedier/frp)

### Server端

```toml
bindPort = 7000

auth.token = "<token>"
```

### Client端

```toml
user = "shejialuo_china"

serverAddr = "<server_addr>"
serverPort = 7000

auth.method = "token"
auth.token = "<token>"

[[proxies]]
name = "ssh"
type = "tcp"
localIP = "127.0.0.1"
localPort = 22
remotePort = 6000
```
