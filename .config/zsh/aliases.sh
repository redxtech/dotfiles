#!/usr/bin/env sh

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

# remind me that I'm not running vim
alias :q="not-vim"
alias :w="not-vim"
alias :x="not-vim"

# some command aliaseviations
alias e='$EDITOR'
alias v='$EDITOR'
alias SS="sudo systemctl"

# docker aliases
# alias docker="sudo docker"
# alias docker-compose="sudo docker-compose"
# alias docker-nuke="docker rm (docker ps -q -a) && docker rmi (docker images -q -a)"

# man function to use colours
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# for fun
alias starwars="telnet towel.blinkenlights.nl"

