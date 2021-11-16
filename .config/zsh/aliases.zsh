#!/usr/bin/env zsh

# new makedir command
alias mkd="mkdir -pv"

# make various commands use colour
alias grep="grep --color"
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# reload the session
alias src="exec zsh"

# fix hors engine
alias hors="hors -e google"

# redo last command as sudo
alias shit='sudo $(fc -ln -1)'

# clipboard alias
alias xclip="xclip -selection c"

# unarchive with atool
alias expand-dong="aunpack"

# show remaining progress with `sync` command
alias dirties="watch -d grep -e Dirty: -e Writeback: /proc/meminfo"

# neofetch with image
alias neofetchk="neofetch --backend kitty --source .config/wall.png"

# edit the todo file
alias todo="$EDITOR ~/.todo.md"

# vim -> nvim
if command -v nvim >/dev/null; then
  alias vvim="$(which vim)"
  alias vim="nvim"
fi

# ls -> exa
if command -v exa >/dev/null; then
  alias lls="$(which ls)"
  alias ls="exa --group-directories-first"
fi

# cat -> bat
if command -v bat >/dev/null; then
  alias ccat="$(which cat)"
  alias cat="bat"
fi

# ping -> prettyping
if command -v prettyping >/dev/null; then
  alias pping="$(which ping)"
  alias ping="prettyping --nolegend"
fi

# pipes.sh -> pipes
if command -v pipes.sh >/dev/null; then
  alias pipes="pipes.sh -p 4 -t 3 -r 10000"
fi

# some command aliaseviations
alias e='$EDITOR'
alias v='$EDITOR'
alias ss="sudo systemctl"

# docker aliases
# alias docker="sudo docker"
# alias docker-compose="sudo docker-compose"
# alias docker-nuke="docker rm (docker ps -q -a) && docker rmi (docker images -q -a)"

# for fun
alias starwars="telnet towel.blinkenlights.nl"
alias excuse="fortune bofh-excuses | yosay"
alias excuse-cow="fortune bofh-excuses | cowsay"

## abbreviations

# default to session and quiet
if command -v abbr >/dev/null; then
  alias abbr="abbr -S --quiet"
else
  alias abbr="alias"
fi

# i often spell yadm as yamd
abbr yamd="yadm"

# my common misspellings
abbr ecoh="echo"
abbr pacuar="pacaur"
abbr sudp="sudo"
abbr yarm="yarn"

