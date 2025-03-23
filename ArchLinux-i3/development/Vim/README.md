# Vim Plugin

## Plugin Manager

Use [vim-plug](https://github.com/junegunn/vim-plug) as the plugin manager.

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Theme

### Colorscheme

Use [dracula](https://github.com/dracula/vim) as the colorscheme.

### Status Bar

Use [vim-airline](https://github.com/vim-airline/vim-airline) for the status bar.

### Highlight

Use [vim-polyglot](https://github.com/sheerun/vim-polyglot) for language highlight.

## Tool

### Git Related

Use [vim-gitgutter](https://github.com/airblade/vim-gitgutter) for git support.

### Comment

Use [NERD Commenter](https://github.com/preservim/nerdcommenter) for comment handling.

### Time Collection

Use [vim-wakatime](https://github.com/wakatime/vim-wakatime) to collect the time usage.

## Editor Config

Use [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) editor config.

## IDE Support

I mainly use VsCode to develop code. `vim` often used to handle some minor tasks. Just
install [coc.nvim](https://github.com/neoclide/coc.nvim) to easily set up the IDE
features.

### Plugins

+ [coc-spell-checker](https://github.com/iamcco/coc-spell-checker)
+ [coc-yank](https://github.com/neoclide/coc-yank)
+ [coc-yaml](https://github.com/neoclide/coc-yaml)
+ [coc-sh](https://github.com/josa42/coc-sh)
+ [coc-pyright](https://github./fannheyward/coc-pyright)
+ [coc-clangd](https://github.com/clangd/coc-clangd)
+ [coc-json](https://github.com/neoclide/coc-json)
+ [coc-lists](https://github.com/neoclide/coc-lists)
+ [coc-diagnostic](https://github.com/iamcco/coc-diagnostic)
+ [coc-explorer](https://github.com/weirongxu/coc-explorer)

```sh
vim -c "CocInstall coc-spell-checker coc-yank coc-yaml \
    coc-sh coc-pyright coc-clangd coc-json coc-lists \
    coc-diagnostic coc-explorer" -c "q"
```
