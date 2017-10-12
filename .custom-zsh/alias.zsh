# Aliases

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias distro="cat /etc/os-release | grep ID= | tr -d 'ID='"

alias ls="ls --color=auto"
alias grep="grep --color"
alias whence="type -a"

alias zconf="nano $HOME/.zshrc"
alias pconf="nano $ZSH_CUSTOM/prof.zsh"
alias resrc="source $HOME/.zshrc"
alias reload="source $HOME/.zshrc"

# alias pacman="sudo pacman"
alias please='sudo $(fc -ln -1)'
alias shit="please"

# Reminders
# alias inst="echo pacman -S package"
# alias uninst="echo pacman -Rs package"
# alias purge="echo pacman -Rsn package"
# alias updatesrc="echo pacman -Sy"
# alias update="echo pacman -Syu"
# alias search="echo pacman -Q searchterm"
# alias searchd="echo pacman -Ss searchterm"
# alias searchi="echo pacman -Qs searchterm"
