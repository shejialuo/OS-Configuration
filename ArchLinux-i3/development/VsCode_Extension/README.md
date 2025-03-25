# VsCode/Cursor 插件

## 1. 基本工具

+ Better Comments
+ file-size
+ Todo Tree
+ Vim
+ Code Spell Checker
+ Dracula Theme Official
+ Guides
+ Material Icon Theme
+ Path Intellisense
+ Remote - SSH
+ Remote - SSH: Editing Configuration file
+ Remote Explorer
+ Trailing Spaces
+ EditorConfig for VS Code
+ WakaTime

## 2. Shell

+ Bash IDE

## 3. C/C++

+ clangd
+ CMake Tools
+ Doxygen Documentation Generator

## 4. Haskell

+ Haskell
+ Haskell Syntax Highlighting

## 5. Toml

+ Even Better TOML

## 6. Python

+ Python
+ Python Debugger
+ Pylance
+ Black Formatter
+ isort

## 7. Latex

+ LaTex Workshop

## 8. Markdown

+ Mermaid Markdown Syntax Highlighting
+ markdownlint
+ Markdown Preview Mermaid Support
+ Markdown Preview Enhanced

## 9. Go

+ Go

## 10. Github Copilot

+ GitHub Copilot
+ Github Copilot Chat

Install some copilot based extensions in [Github Market](https://github.com/marketplace?type=apps&copilot_app=true).

+ PerplexityAI
+ Mermaid Chart

## 11. WorkAround for Panel Size

VsCode似乎一直不支持自定义panel size，但是偏偏Github copilot chat就是用的panel，只能hack。

安装插件`Custom CSS and JS Loader`，使用如下的配置：

```json
{
    "vscode_custom_css.imports": ["file:///home/shejialuo/.config/Code/editor.css"],
}
```

其中，文件的内容如下：

```css
.pane-composite-part.right .content * { font-size: 14px !important; }
```
