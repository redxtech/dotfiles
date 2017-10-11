export ZSH=/home/redxtech/.oh-my-zsh
ZSH_THEME="red-z"
export ZSH_CUSTOM="$HOME/.custom-zsh"
# ENABLE_CORRECTION="true"

plugins=(git, thefuck)

source $ZSH/oh-my-zsh.sh

# source custom files
if [ -f "${ZSH_CUSTOM}/env.zsh" ]; then
	source $ZSH_CUSTOM/env.zsh
fi
if [ -f "${ZSH_CUSTOM}/alias.zsh" ]; then
        source $ZSH_CUSTOM/env.zsh
fi

if [ -f "${ZSH_CUSTOM}/running.zsh" ]; then
        source $ZSH_CUSTOM/running.zsh
fi

# Custom profile
source ~/.prof
