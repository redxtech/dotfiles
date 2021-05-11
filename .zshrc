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
setopt appendhistory append_history share_history histignorealldups autocd beep extendedglob notify autocd histignorespace
bindkey -v

# theme setup
ZSH_THEME="zshred"

# oh-my-zsh plugin setup
_CURR_DISTRO="$(~/.local/bin/utils/distro)"

if test "$_CURR_DISTRO" = "arch" -o "$_CURR_DISTRO" = "garuda"; then
    # arch specific plugins (read: main setup)
    plugins=(
        # repo plugins
        archlinux
        asdf
        # cargo
        command-not-found
        docker
        docker-compose
        # dotenv
        extract
        fd
        fzf
        gcloud
        git
        # git-flow
        gitfast
        history-substring-search
        # npx
        ripgrep
        # rust
        # systemd
        thefuck
        tmux
        vagrant
        yarn
        z

        omz
        zsh-syntax-highlighting
    )

    # plugin specific options
    zstyle :omz:plugins:ssh-agent agent-forwarding on
    zstyle :omz:plugins:ssh-agent identities id_rsa # id_github
else
    # plugins for alternate machines
    plugins=(
        command-not-found
        docker
        docker-compose
        # dotenv
        extract
        git
        history-substring-search
        npx
        yarn
        z

        omz
        zsh-syntax-highlighting
    )
fi

autoload -U compinit && compinit -d "$HOME/.cache/zsh/zcompdump-$ZSH_VERSION"

# source oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

# source the profile script
[[ -f "$HOME/.profile" ]] && source "$HOME/.profile"
[[ -f "$HOME/.profile2" ]] && source "$HOME/.profile2"

