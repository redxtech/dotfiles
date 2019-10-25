#!/usr/bin/env zsh

# zsh & oh-my-zsh config

# location of scripts
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.config/zsh"

# zsh config
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd beep extendedglob notify
bindkey -v

# theme setup
ZSH_THEME="zshred"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# plugin setup
plugins=(
    git
)

# source oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

# source the profile script
[[ -f "$HOME/.profile" ]] && source "$HOME/.profile"

