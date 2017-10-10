export ZSH=/home/redxtech/.oh-my-zsh
ZSH_THEME="red-z"
export ZSH_CUSTOM=/home/redxtech/.custom
ENABLE_CORRECTION="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source $ZSH_CUSTOMx/env.zsh
source $ZSH_CUSTOM/alias.zsh
source $ZSH_CUSTOM/running.zsh

# Custom profile
source ~/.prof
