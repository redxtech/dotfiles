#!/usr/bin/env zsh

# zsh plugin to remind you that you're not in vim

# add the functions to the function path & autoload them
fpath+=("$(dirname ${0})/functions")
autoload -Uz not-vim

# set aliases for the not-vim command to be effective
alias :q="not-vim"
alias :w="not-vim"
alias :x="not-vim"

