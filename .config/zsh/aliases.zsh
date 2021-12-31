#!/usr/bin/env zsh

# some ls shortcuts
alias la="ls -al"
alias ll="ls -l"
alias l="ls -l"

# make rm safer
alias rm="rm -Iv"

# mv is now verbose
alias mv="mv -v"

# new makedir command
alias mkd="mkdir -pv"

# make various commands use colour
alias grep="grep --color"
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# reload the session
alias src="exec zsh"

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
  alias vim="nvim"
fi

# goneovim -> gvim
if command -v goneovim >/dev/null; then
  alias gvim="goneovim"
  alias gnvim="gvim"
fi


# ls -> exa
if command -v exa >/dev/null; then
  alias ls="exa --group-directories-first"
fi

# cat -> bat
if command -v bat >/dev/null; then
  alias cat="bat"
fi

# ping -> prettyping
if command -v prettyping >/dev/null; then
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
alias svim="sudo -e"

# swallow windows for certain apps
if command -v devour >/dev/null; then
  local swallowed=(mpv sxiv)

  for app in $swallowed; do
    alias $app="devour $app"
  done
fi

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
abbr yand="yadm"

# my common misspellings
abbr ecoh="echo"
abbr pacuar="pacaur"
abbr sudp="sudo"
abbr yarm="yarn"
alias dc="cd"

