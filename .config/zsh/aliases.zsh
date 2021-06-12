#!/usr/bin/env zsh

# new makedir command
alias mkd="mkdir -pv"

# make various commands use colour
alias grep="grep --color"
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# redo last command as sudo
alias shit='sudo $(fc -ln -1)'

# clipboard alias
alias xclip="xclip -selection c"

# vim -> nvim
if command -v nvim >/dev/null; then
    alias vim="nvim"
fi

# ls -> exa
if command -v exa >/dev/null; then
    alias ls="exa --group-directories-first"
fi

# cat -> bat
if command -v bat >/dev/null; then
    alias cat="bat --theme TwoDark"
fi

# ping -> prettyping
if command -v prettyping >/dev/null; then
    alias ping="prettyping --nolegend"
fi

# some command aliaseviations
alias e='$EDITOR'
alias v='$EDITOR'
alias ss="sudo systemctl"

# docker aliases
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
# alias docker-nuke="docker rm (docker ps -q -a) && docker rmi (docker images -q -a)"

# for fun
alias starwars="telnet towel.blinkenlights.nl"

## abbreviations

# default to session and quiet
alias abbr="abbr -S --quiet"

# i often spell yadm as yamd
abbr yamd="yadm"

# my common misspellings
abbr ecoh="echo"
abbr pacuar="pacaur"

