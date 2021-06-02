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
plugins=(
    # repo plugins
    bgnotify
    # cargo
    colored-man-pages
    command-not-found
    copybuffer
    docker
    docker-compose
    dotenv
    emoji
    encode64
    extract
    fd
    frontend-search
    fzf
    gitfast
    gpg-agent
    history-substring-search
    keychain
    man
    perms
    ripgrep
    # rust
    # rustup
    safe-paste
    ssh-agent
    sublime
    systemd
    thefuck
    tmux
    transfer
    vscode
    wd
    yarn
    zsh_reload
    zsh-interactive-cd

    # manually installed plugins
    omz
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

_CURR_DISTRO="$(lsb_release -is)"
if test "$(lsb_release -is)" = "Arch" -o "$(lsb_release -is)" = "Garuda"; then
    plugins+=(archlinux)
    VSCODE=code-insiders
elif test "$(lsb_release -is)" = "openSUSE"; then
    plugins+=(suse)
fi

# plugin specific options
zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities id_rsa # id_ed25519 id_github 2C5879C2
zstyle :omz:plugins:keychain options --quiet
zstyle :omz:plugins:ssh-agent agent-forwarding on
ZSH_DOTENV_PROMPT=false

autoload -U compinit && compinit -d "$HOME/.cache/zsh/zcompdump-$ZSH_VERSION"

# source oh-my-zsh
source "$ZSH/oh-my-zsh.sh"

# source the custom zsh config
# shellcheck source=.config/zsh/init.zsh
[ -f "$ZSH_CUSTOM/init.zsh" ] && . "$ZSH_CUSTOM/init.zsh"
