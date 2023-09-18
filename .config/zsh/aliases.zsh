#!/usr/bin/env zsh

# aliases

# allow aliases to work with sudo
alias sudo="sudo "

# some ls aliases
alias la="ls -al"
alias ll="ls -l"
alias l="ls -l"

# make rm safer
alias rm="rm -i"

# make mv verbose
alias mv="mv -v"

# easy mkdir
alias mkd "mkdir -pv"

# some command abbreviations
alias e='$EDITOR'
alias svim="sudo -e"

# add colour to various commands
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias diff="diff --color=auto"
alias ip="ip --color=auto"

# make rsync show progress
command -v rsync >/dev/null && alias rsync="rsync --info=progress2 -r"

# commonly used rclone command
command -v rclone >/dev/null && alias rcp="rclone copy -P --transfers=20"

# npm run -> npr
command -v npm >/dev/null && alias npr="npm run"

# reload the shell session
alias src='exec $SHELL'

# redo last command with sudo
alias shit='sudo $(fc -ln -1)'
alias please='sudo $(fc -ln -1)'

# clipboard alias
command -v xclip >/dev/null && alias xclip="xclip -selection c"

# unarchive with atool
command -v aunpack >/dev/null && alias expand-dong="aunpack"

# show remaining progress with `sync` command
alias dirties="watch -d grep -e Dirty: -e Writeback: /proc/meminfo"

# run ps_mem with sudo
command -v ps_mem >/dev/null && alias ps_mem="sudo ps_mem"

# neofetch with image backend
command -v neofetch >/dev/null && alias neofetchk='neofetch --backend kitty --source $HOME/.config/wall.png'

# edit my todo file
alias todo='$EDITOR $HOME/.todo.md'

# lazygit for dotfiles
command -v lazygit >/dev/null && alias ly='lazygit --git-dir=$HOME/.local/share/yadm/repo.git --work-tree=$HOME'

# systemctl shortcuts
alias ss="sudo systemctl"
alias sss="sudo systemctl start"
alias ssst="sudo systemctl stop"
alias ssr="sudo systemctl restart"
alias sse="sudo systemctl enable --now"
alias ssdr="sudo systemctl daemon-reload"
alias scu="systemctl --user"
alias ssu="systemctl --user start"
alias stu="systemctl --user stop"
alias sru="systemctl --user restart"
alias seu="systemctl --user enable --now"
alias sdru="systemctl --user daemon-reload"

# docker aliases
# moved to zsh plugin redxtech/zsh-containers

# kubernetes aliases
if command -v kubectl >/dev/null; then
	alias kak="kubectl apply -k"
	alias krr="kubectl rollout restart"
	alias krd="kubectl rollout restart deployment"
	alias kl="kubectl logs"
	alias kns="kubens"
	alias ktx="kubectx"
fi

# nixos aliases
if command -v /dev/null; then
	alias nix-update="sudo nixos-rebuild switch"
	alias nix-upgrade="sudo nixos-rebuild switch --upgrade"
fi

# for fun
alias starwars="telnet towel.blinkenlights.nl"
alias excuse="fortune bofh-excuses | cowsay"

# command replacements

# vim -> nvim
command -v nvim >/dev/null && alias alias vim="nvim"

# goneovim -> gvim
command -v goneovim >/dev/null && alias gvim="goneovim"
command -v goneovim >/dev/null && alias gnvim="goneovim"

# ls -> eza
command -v eza >/dev/null && alias ls="eza --group-directories-first --header"

# cat -> bat
command -v bat >/dev/null && alias cat="bat"

# ping -> prettyping
command -v prettyping >/dev/null && alias ping="prettyping"

# pipes.sh -> pipes
command -v pipes.sh >/dev/null && alias pipes="pipes.sh"

# swallow windows for certain apps
if command -v devour >/dev/null; then
  local swallowed=(feh mpv sxiv)

  for app in $swallowed; do
		if command -v $app >/dev/null; then
			alias $app="devour $app"
		fi
  done
fi

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
abbr clera="clear"
abbr claer="clear"
abbr dc="cd"

