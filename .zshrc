#!/usr/bin/env zsh

# zsh & antigen config

# custom zsh config location
ZSH_CUSTOM="$HOME/.config/zsh"
ANTIGEN_PATH="$ZSH_CUSTOM/antigen"

# zsh config
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory append_history share_history histignorealldups autocd beep extendedglob notify histignorespace
bindkey -v

# plugin config
zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities id_ed25519 # id_github
zstyle :omz:plugins:keychain options --quiet
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle ":morpho" screen-saver "pipes.sh"
zstyle ":morpho" arguments "-p 4 -t 3 -r 10000"
zstyle ":morpho" delay "600"
zstyle ":morpho" check-interval "60"
ZSH_DOTENV_PROMPT=false

# load antigen & all antigen config
source "$ANTIGEN_PATH/antigen.zsh"
antigen init "$HOME/.antigenrc"

# load zoxide (antigen wont use it for some reason)
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# autoload & compile the functions if it hasn't been done in the last 24h
autoload -Uz compinit
if [[ -n "$HOME/.cache/zsh/zcompdump-$ZSH_VERSION"(#qN.mh+24) ]]; then
  compinit -C -d "$HOME/.cache/zsh/zcompdump-$ZSH_VERSION"
fi

# source the custom zsh environment
# shellcheck source=.config/zsh/init.zsh
[ -f "$ZSH_CUSTOM/init.zsh" ] && . "$ZSH_CUSTOM/init.zsh"
