#!/usr/bin/env zsh

# basic environment
EDITOR="nvim"
VISUAL="nvim"
TERMINAL="$(command -v kitty)"
BROWSER="$(command -v vivaldi-stable)"

# if nvim is installed switch the variable to that
if command -v nvim>/dev/null; then
    EDITOR="$(command -v nvim)"
fi

# export the variables
export EDITOR
export TERMINAL
export BROWSER

# program specific
export RANGER_LOAD_DEFAULT_RC="FALSE"
export BAT_THEME=Dracula
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'


# TODO: see if plugin for this
# source local env file
if test -f "$HOME/.config/zsh/env.local.zsh"; then
    source "$HOME/.config/zsh/env.local.zsh"
fi
