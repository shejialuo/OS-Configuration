# 本地AI部署

Token目前费用太高，由于我有4080s显卡，想着还是用本地模型。

## ollama

```sh
sudo pacman -S ollama ollama-cuda
```

经过测试，在context为65K的情况下，qwen3.5 9B的效果是最好的（4080s还是显存有限）。

```sh
ollama pull qwen3.5:9b
```

## opencode集成

使用`ollama`命令可以直接启动`opencode`：

```sh
ollama launch opencode --model qwen3.5:9b
```

然而，这种方式始终不方便。可以在`opencode`里面添加如下的内容解决这个问题：

```json
{
  "provider": {
    "ollama": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Ollama Local",
      "options": {
        "baseURL": "http://localhost:11434/v1"
      },
      "models": {
        "qwen3.5:9b": {
          "name": "Qwen3.5 9B"
        }
      }
    }
  }

```
