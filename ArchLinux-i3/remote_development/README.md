# 远程开发

在家也想使用实验室的主机进行远程开发，不打算使用任何桌面环境。所有开发通过`tmux + vim`以及命令行的方式进行。不想使用VsCode的`Remote-SSH`，过于麻烦，使用最简单的方式。

## 内网穿透

内网穿透相当的简单，直接使用开源工具[frp](https://github.com/fatedier/frp)

### Server端

```ini
[common]
bind_port = 7000
tls_enable = true
token = <your_token>
```

### Client端

```ini
[common]
server_addr = <your_ip>
server_port = 7000
tls_enable = true
token = <your_token>

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6000
```

然后就可以直接ssh连接了。为了避免断网，使用`crontab`每5分钟执行脚本，判断是否断网及重启`frpc`服务：

```py
import subprocess
import requests

def new_process(command):
    p = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE,encoding="utf-8")
    return p

def test_connection() -> bool:
    url = "https://www.baidu.com"
    try:
        global result
        result = requests.get(url, timeout=3)
    except:
        return False
    if (result.status_code == 200):
        return True
    else:
        return False


def connect(username: str, password: str) -> None:

    url = 'https://w.xidian.edu.cn/srun_portal_pc.php'

    data = {
        "username": username,
        "password": password,
        'action': 'login',
        'ac_id': '1',
        'save_me': '1'
    }

    header = {
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
        "Accept-Encoding": "gzip, deflate, br",
        "Accept-Language": "zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6",
        "Cache-Control": "max-age=0",
        "Connection": "keep-alive",
        "Host": "w.xidian.edu.cn",
        "Upgrade-Insecure-Requests": "1",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62",
    }

    try:
        response = requests.post(url, data, headers=header)
    except requests.exceptions.ProxyError:
        print("some unexpected error")
        return

def main():

    if not test_connection():
        print("trying to connect")
        connect('', '')

if __name__ == '__main__':
    main()

```

## vim

实际上在本机中我已经配置好了vim，此处仅仅记录。

### 主题

+ 使用[dracula](https://github.com/dracula/vim.git)作为vim的配色主题。
+ 使用[vim-airline](https://github.com/vim-airline/vim-airline)作为vim的状态栏以及[vim-airline-theme](https://github.com/vim-airline/vim-airline-themes)作为状态栏的主题。

### Git

+ 使用[vim-fugitive](https://github.com/tpope/vim-fugitive)作为Git的快捷键，说实在的，使用频率很低。
+ 使用[vim-gitgutter]作为Git的chunk处理，高频率使用。

### 工具

+ [nerdcommenter](https://github.com/preservim/nerdcommenter)
+ 记不清楚那么多的快捷键，使用[vim-which-key](https://github.com/liuchengxu/vim-which-key)辅助。
+ 记录时间[vim-wakatime](https://github.com/wakatime/vim-wakatime)。
+ 语言高亮支持[vim-polyglot](https://github.com/sheerun/vim-polyglot)

## coc.nvim

使用[coc.nvim](https://github.com/neoclide/coc.nvim.git)作为补全及IDE环境支撑。
