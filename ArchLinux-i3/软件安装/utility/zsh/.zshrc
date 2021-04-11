export ZSH="/home/shejialuo/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions web-search autojump zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
alias pc="proxychains4"
alias p-on="export https_proxy=http://127.0.0.1:7890; export http_proxy=http://127.0.0.1:7890"
alias p-off="unset http_proxy https_proxy"