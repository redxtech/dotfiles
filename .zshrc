#!/usr/bin/env zsh

# zsh & zinit config

# enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


# custom zsh config location
ZSH_CUSTOM="$HOME/.config/zsh"

# zsh config
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# zsh options
setopt auto_cd                    # auto cd into dirs
setopt append_history             # each shell adds its history on exit
setopt hist_ignore_dups           # keep duplicates in the histfile, if not consecutive
setopt hist_ignore_space          # prefix command with space to exclude from history
setopt share_history              # share history betweeen shells
setopt extended_glob              # include #, ^, & ~ in globbing
setopt hist_reduce_blanks         # remove unnecessary spaces
setopt no_correct                 # don't do corrections
setopt notify                     # show backgrounded jobs immediately
setopt prompt_subst               # expand functions in prompt
setopt transient_rprompt          # don't include right prompt in history 
setopt function_arg_zero          # set $0 for each function, script, etc
setopt no_menu_complete              # autocomplete menu

# vim keybindings
bindkey -v

# hyphen & case insensitive completions 
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'

# plugin config
zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities id_ed25519 # id_github
zstyle :omz:plugins:keychain options --quiet
zstyle :omz:plugins:ssh-agent agent-forwarding on
FAST_ALIAS_TIPS_PREFIX="$(tput setaf 4)Alias tip: "

# load zoxide (zinit wont use it for some reason)
# (( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# all zinit config here
source "$ZSH_CUSTOM/zinit.zsh" 

# autoload & compile the functions if it hasn't been done in the last 24h
autoload -Uz compinit
ZSH_COMPDUMP="${ZINIT[ZCOMPDUMP_PATH]:-${ZDOTDIR:-$HOME}/.zcompdump}"
if [[ -n "$ZSH_COMPDUMP"(#qN.mh+24) ]]; then
  compinit -C -d "$ZSH_COMPDUMP"
fi

# load kitty completions if in kitty
# if test "$TERM" = "xterm-kitty"; then
  # eval "$(kitty + complete setup zsh)"
# fi

# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# source the custom zsh environment
# shellcheck source=.config/zsh/init.zsh
[ -f "$ZSH_CUSTOM/init.zsh" ] && . "$ZSH_CUSTOM/init.zsh"

