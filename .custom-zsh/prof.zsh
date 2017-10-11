# Custom profile for redxtech

# Add ssh keys
setopt extendedglob
if [[ -n $HOME/.ssh/*.pem(#qN) ]]; then
	ssh-add $HOME/.ssh/*.pem
fi
if [[ -n $HOME/.ssh/*_rsa(#qN) ]]; then
        ssh-add $HOME/.ssh/*_rsa
fi

# Clear on startup
clear
