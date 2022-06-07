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

# TODO: see if plugin for this
# source local env file
if test -f "$HOME/.config/zsh/env.local.zsh"; then
    source "$HOME/.config/zsh/env.local.zsh"
fi
