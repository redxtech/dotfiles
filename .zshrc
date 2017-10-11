export ZSH=/home/redxtech/.oh-my-zsh
ZSH_THEME="red-z"
export ZSH_CUSTOM="$HOME/.custom-zsh"
# ENABLE_CORRECTION="true"

plugins=(git, thefuck)

source $ZSH/oh-my-zsh.sh

source $ZSH_CUSTOM/env.zsh
source $ZSH_CUSTOM/alias.zsh
source $ZSH_CUSTOM/running.zsh

# Custom profile
source ~/.prof
