export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="red-z"
export ZSH_CUSTOM="$HOME/.custom-zsh"
# ENABLE_CORRECTION="true"

plugins=(
	archlinux,
	git,
	git-extras,
	thefuck,
	yarn,
	golang,
	git-flow,
	ruby,
	gem,
	rvm,
	rails,
	jsontools,
	systemd,
	emoji
)

source $ZSH/oh-my-zsh.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/lib/go-1.10/bin"
source ~/.rvm/scripts/rvm

# Add NVM to path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
