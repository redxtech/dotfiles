#!/usr/bin/env sh

# basic environment
export TERMINAL="/usr/bin/alacritty"
export EDITOR="/usr/bin/nvim"
export BROWSER="/usr/bin/vivaldi-snapshot"

# program specific
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export RANGER_LOAD_DEFAULT_RC="FALSE"

# local
if test -e "$HOME/.config/zsh/.env"; then
    # shellcheck disable=SC1090
    . "$HOME/.config/zsh/.env"
fi

