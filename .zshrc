#!/usr/bin/env zsh

# zsh & oh-my-zsh config

# location of scripts
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/zsh"

# zsh config
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory append_history share_history histignorealldups autocd beep extendedglob notify autocd
bindkey -v

# theme setup
ZSH_THEME="zshred"

# plugin setup
plugins=(
    # repo plugins
    # archlinux
    asdf
    # aws
    # cargo
    command-not-found
    # docker
    # docker-compose
    # dotenv
    extract
    fd
    # firewalld
    fzf
    git
    # git-extra-commands
    # git-extras
    # git-flow
    gitfast
    # golang
    npx
    omz
    # pip
    ripgrep
    # rust
    thefuck
    tmux
    yarn

    # cloned plugins
    # zsh-completions
    # zsh-autosuggestions
    zsh-syntax-highlighting
)

autoload -U compinit && compinit -d "$HOME/.cache/zsh/zcompdump-$ZSH_VERSION"

# source oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

# source the profile script
[[ -f "$HOME/.profile" ]] && source "$HOME/.profile"

