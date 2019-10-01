# Aliases

# dotfiles git alias (deprecated in favour of yadm)
# alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# run `distro` to see which distro is currently running
alias distro="cat /etc/os-release | grep \"^ID=\" | tr -d 'ID='"

# small command preferences
alias ls="ls --color=auto"
alias grep="grep --color"
alias whence="type -a"

# config edit shortcuts
alias fconf="nano $HOME/.config/fish/config.fish"
alias pconf="nano $OMF_CONFIG/prof.fish"
alias aconf="nano $OMF_CONFIG/aliases.fish"
alias resrc="omf reload"
alias reload="omf reload"

# webserver shortcuts
alias webup="sudo systemctl start nginx"
alias webdn="sudo systemctl stop nginx"
alias webrs="sudo systemctl restart nginx"

# redo last command as sudo
alias please='sudo (fc -ln -1)'
alias shit="please"

# nordvpn aliases
alias nordvpn="sudo nordvpn"
alias nordvpn-rank="sudo nordvpn best -r na"

# docker aliases
# alias docker="sudo docker"
# alias docker-compose="sudo docker-compose"
# alias docker-nuke="docker rm (docker ps -q -a) && docker rmi (docker images -q -a)"

# clipboard alias
alias xclip="xclip -selection c"

# ls -> exa
alias ls="exa"

# plex aliases
alias plexup="sudo systemctl start pms"
alias plexdn="sudo systemctl stop pms"
alias plexst="sudo systemctl status pms"

