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

# ping -> prettyping
if command -v prettyping >/dev/null; then
    alias ping="prettyping --nolegend"
fi

# remind me that I'm not running vim
alias :q="not-vim"
alias :w="not-vim"
alias :x="not-vim"

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

