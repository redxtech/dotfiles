#!/usr/bin/env zsh

# basic environment
EDITOR="$(command -v vim)"
TERMINAL="$(command -v alacritty)"

# if nvim is installed switch the variable to that
if command -v nvim>/dev/null; then
    EDITOR="$(command -v nvim)"
fi

# export the variables
export EDITOR
export TERMINAL

# program specific
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export RANGER_LOAD_DEFAULT_RC="FALSE"

# TODO: see if plugin for this
# source local env file
if test -f "$HOME/.config/zsh/env.local.zsh"; then
    source "$HOME/.config/zsh/env.local.zsh"
fi
