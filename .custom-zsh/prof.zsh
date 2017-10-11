# Custom profile for redxtech

# Add ssh keys
ssh-add ~/.ssh/*.pem

if [ -f "${HOME}/.ssh/id_rsa" ]; then
	ssh-add $HOME/.ssh/id_rsa
fi
if [ -f "${HOME}/.ssh/aws_rsa" ]; then
	ssh-add $HOME/.ssh/aws_rsa
fi

# Clear on startup
clear
