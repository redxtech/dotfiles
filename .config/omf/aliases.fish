# Aliases

# run `distro` to see which distro is currently running
alias distro="cat /etc/os-release | grep \"^ID=\" | tr -d 'ID='"

# small command preferences
alias grep="grep --color"
alias whence="type -a"

# config edit shortcuts
alias fconf="$EDITOR $HOME/.config/fish/config.fish"
alias aconf="$EDITOR $OMF_CONFIG/aliases.fish"
alias resrc="omf reload"

# some command aliases alias SS="sudo systemctl"
alias v="$EDITOR"
alias vim="$EDITOR"
alias mkd="mkdir -pv"

# webserver shortcuts
alias webup="sudo systemctl start nginx"
alias webdn="sudo systemctl stop nginx"
alias webrs="sudo systemctl restart nginx"

# redo last command as sudo
alias please='sudo (fc -ln -1)'
alias shit="please"

# nordvpn aliases
# alias nordvpn="sudo nordvpn"
# alias nordvpn-rank="sudo nordvpn best -r na"

# docker aliases
# alias docker="sudo docker"
# alias docker-compose="sudo docker-compose"
# alias docker-nuke="docker rm (docker ps -q -a) && docker rmi (docker images -q -a)"

# clipboard alias
alias xclip="xclip -selection c"

# ls -> exa
alias ls="exa --group-directories-first"

# plex aliases
alias plexup="sudo systemctl start pms"
alias plexdn="sudo systemctl stop pms"
alias plexst="sudo systemctl status pms"

# for fun
alias starwars="telnet towel.blinkenlights.nl"

# remind me that I'm not running vim
alias :q="not_vim"
alias :w="not_vim"
alias :x="not_vim"

