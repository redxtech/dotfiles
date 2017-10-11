# Simple, informative, and pleasant theme for zsh via oh-my-zsh.
# Inspired by babun, ys, and 
# Works well on both light & dark background.
# Colours: red, blue, green, and cyan.
#
# Oct 2017 Gabe Dunn

# VCS
RZ_VCS_COLOUR=$fg[green]
RZ_VCS_CLEAN_SUFFIX=""
RZ_VCS_DIRTY_SUFFIX="*"

# Git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$RZ_VCS_COLOUR%}:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$RZ_VCS_CLEAN_SUFFIX%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$RZ_VCS_DIRTY_SUFFIX%}"

# SSH info
RZ_SSH_COLOUR=$fg_bold[cyan]
RZ_SSH_PREFIX="("
RZ_SSH_SUFFIX=")"
RZ_SSH_INDICATOR="ssh"

# Return Code
RZ_RETURN_CODE_COLOUR=$fg[red]

# Time indicator
RZ_TIME_24H=true
RZ_TIME_COLOUR=$fg[cyan]

# Prompt format (--> means on right side of screen):
# λ (ssh) { directory:branch } --> [full dir path][last error code][time]
# » OR # COMMAND
#
# For example:
# λ (ssh) { repo:master* } --> [~/projects/repo][12:30]
# » echo Hello, world!


# Main prompt
PROMPT='\
%{$fg_bold[red]%}λ %{$reset_color%}\
$(ssh_info)\
%{$fg[blue]%}{ %c$(git_prompt_info)%{$fg[blue]%} }
%{$fg[red]%}%(!.#.»)%{$reset_color%} '

# Secondary prompt
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

# Right prompt
local return_code="%(?..%{$RZ_RETURN_CODE_COLOUR%}[%?]%{$reset_color%})"
RPS1='%{$fg[blue]%}[%~]%{$reset_color%}${return_code}%{$RZ_TIME_COLOUR%}[$(time_info)]%{$reset_color%}'

# Functions

# time function
function time_info() {
	if [ $RZ_TIME_24H ]; then
		echo "%T"
	else
		echo "%@"
	fi
}

# ssh info function
function ssh_info() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$RZ_SSH_COLOUR%}%{$RZ_SSH_PREFIX%}%{$RZ_SSH_INDICATOR%}%{$RZ_SSH_SUFFIX%}%{$reset_color%} "
  fi
}