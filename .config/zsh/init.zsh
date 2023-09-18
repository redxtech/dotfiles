#!/usr/bin/env zsh

# init script

# zshrc stuff

# enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# souce zprofile
test -f "$HOME/.zprofile" && source "$HOME/.zprofile"

# set custom zsh config location
ZSH_CUSTOM="$HOME/.config/zsh"

# zsh config
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
HISTTIMEFORMAT="[%F %T] "

# zsh options
setopt auto_cd                    # auto cd into dirs
setopt append_history             # each shell adds its history on exit
setopt hist_ignore_dups           # keep duplicates in the histfile, if not consecutive
setopt hist_ignore_space          # prefix command with space to exclude from history
setopt extended_glob              # include #, ^, & ~ in globbing
setopt hist_reduce_blanks         # remove unnecessary spaces
setopt no_correct                 # don't do corrections
setopt notify                     # show backgrounded jobs immediately
setopt prompt_subst               # expand functions in prompt
setopt transient_rprompt          # don't include right prompt in history 
setopt function_arg_zero          # set $0 for each function, script, etc
setopt no_menu_complete           # autocomplete menu
bindkey -v                        # vim keybindings

# hyphen & case insensitive completions 
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'

# plugin config
export AUTO_NOTIFY_EXPIRE_TIME=10000

# load zinit config
source "$ZSH_CUSTOM/zinit.zsh" 

# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "$ZSH_CUSTOM/p10k.zsh" ]] || source "$ZSH_CUSTOM/p10k.zsh"

# load env variables, path, and aliases

if test -e "$HOME/.config/zsh/env.zsh"; then
  source "$HOME/.config/zsh/env.zsh"
fi

if test -e "$HOME/.config/zsh/path.zsh"; then
  source "$HOME/.config/zsh/path.zsh"
fi

if test -e "$HOME/.config/zsh/aliases.zsh"; then
  source "$HOME/.config/zsh/aliases.zsh"
fi

