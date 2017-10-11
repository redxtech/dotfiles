export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="red-z"
export ZSH_CUSTOM="$HOME/.custom-zsh"
# ENABLE_CORRECTION="true"

plugins=(git, thefuck)
# plugins to add: archlinux, emoji, golang, npm, yarn, 
#
# plugins to look into:
# colourize, git-flow, git-extras, gitignore, 

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
