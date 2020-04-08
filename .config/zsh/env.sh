#!/usr/bin/env sh

# basic environment
EDITOR="$(command -v vim)"

# if nvim is installed switch the variable to that
if command -v nvim>/dev/null; then
    EDITOR="$(command -v nvim)"
fi

# export the editor
export EDITOR

# program specific
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export RANGER_LOAD_DEFAULT_RC="FALSE"

# local
if test -e "$HOME/.config/zsh/.env"; then
    # shellcheck disable=SC1090
    . "$HOME/.config/zsh/.env"
fi

