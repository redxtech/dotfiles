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

# make less show colours
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

if test -f "/etc/profile.d/lesspipe.sh"; then
    . "/etc/profile.d/lesspipe.sh"
fi

export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
