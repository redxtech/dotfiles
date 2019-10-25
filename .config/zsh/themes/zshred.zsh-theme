#!/usr/bin/env zsh

# simple and informative theme for zsh via oh-my-zsh
# inspired by the redfish theme for oh-my-fish

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"

# get user & host if in an SSH  session
function prompt_whoami () {
    if test -n "$SSH_TTY"; then
        printf '%{$fg[cyan]%}(%s@%s) ' $(whoami) $(hostname)
    fi
}

# properly colour the return code based on success
function return_code () {
    if test "$?" -eq 0; then
        # if the return code is 0 set the colour to green
        printf "%%{$fg[green]%%}"
    else
        # otherwise set it to red
        printf "%%{$fg[red]%%}"
    fi

    # print out the return code
    printf "[%%?]"
}

# main prompt
PROMPT='\
%{$fg_bold[red]%}λ%{$reset_color%} \
$(prompt_whoami)\
%{$fg[blue]%}{ %c$(git_prompt_info)%{$fg[blue]%} }
%{$fg_bold[red]%}»%{$reset_color%} '

# secondary prompts
PROMPT2='%{$fg[red]%}\>%{$reset_color%} '

# right prompt
RPROMPT='\
%{$fg[blue]%}[%~]\
$(return_code)\
%{$fg[cyan]%}[$(date +%H:%M)]\
%{$reset_color%}'

# prompt demo
# λ { project:master } --> [~/code/project][0][22:34]
# » <command>

