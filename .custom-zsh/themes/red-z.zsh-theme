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

# Indicators
RZ_IND_PREFIX="("
RZ_IND_SUFFIX=")"
RZ_IND_SEPERATOR=":"
RZ_IND_COLOUR=$fg[cyan]
RZ_IND_SSH="ssh"
RZ_IND_VIM="v"

# Return Code
RZ_RETURN_CODE_COLOUR=$fg[red]

# Time indicator
RZ_TIME_24H=true
RZ_TIME_COLOUR=$fg[cyan]

# Prompt format (--> means on right side of screen):
# λ (indicators) { directory:branch } --> [full dir path][last error code][time]
# » OR # COMMAND
#
# For example:
# λ (ssh:v) { repo:master* } --> [~/projects/repo][12:30]
# » echo Hello, world!


# Main prompt
PROMPT='\
%{$fg_bold[red]%}λ %{$reset_color%}\
$(indicators)\
%{$fg[blue]%}{ %c$(git_prompt_info)%{$fg[blue]%} }
%{$fg[red]%}%(!.#.»)%{$reset_color%} '

# Secondary prompt
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

# Right prompt
local return_code="%(?..%{$RZ_RETURN_CODE_COLOUR%}[%?]%{$reset_color%})"
RPS1='%{$fg[blue]%}[%~]%{$reset_color%}${return_code}%{$RZ_TIME_COLOUR%}[$(time_info)]%{$reset_color%}'

# Functions

# indicators function
function indicators() {
	local seperator
	local ssh=$(ssh_info)
	local vim=$(vim_bg_info)

	if [[ $#ssh != 0 && $#vim != 0 ]]; then
		seperator=$RZ_IND_SEPERATOR
	fi

	local inds="${ssh}${seperator}${vim}"

	if [[ $#inds != 0 ]]; then
		echo "%{$RZ_IND_COLOUR%}${RZ_IND_PREFIX}${inds}${RZ_IND_SUFFIX} "
	else
		echo ""
	fi
}

function vim_bg_info() {
  if [[ $VIM != "" ]]; then
    echo "v"
  fi
}

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
    	echo "%{$RZ_IND_SSH%}"
  	fi
}