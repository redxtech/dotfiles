# Aliases

# run `distro` to see which distro is currently running
alias distro="cat /etc/os-release | grep \"^ID=\" | tr -d 'ID='"

# small command preferences
alias grep="grep --color"
alias whence="type -a"

# new makedir command
alias mkd="mkdir -pv"

# redo last command as sudo
alias please='sudo (fc -ln -1)'
alias shit="please"

# docker aliases
# alias docker="sudo docker"
# alias docker-compose="sudo docker-compose"
# alias docker-nuke="docker rm (docker ps -q -a) && docker rmi (docker images -q -a)"

# clipboard alias
alias xclip="xclip -selection c"

# vim -> nvim
if type -q nvim
    alias vim="nvim"
end

# ls -> exa
if type -q exa
    alias ls="exa --group-directories-first"
end

# remind me that I'm not running vim
alias :q="not-vim"
alias :w="not-vim"
alias :x="not-vim"

