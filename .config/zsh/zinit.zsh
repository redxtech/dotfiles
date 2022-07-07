#!/usr/bin/env zsh

# TODO fix autocomplete issue (\*)

# install zinit if it isn't already installed
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

# load zinit
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# load annexes
zinit light zdharma-continuum/zinit-annex-bin-gem-node
zinit light zdharma-continuum/zinit-annex-patch-dl

# zsh prompt
zinit ice depth=1
zinit light romkatv/powerlevel10k

# can't load this one in turbo mode, abbr is used in aliases.zsh
zinit light olets/zsh-abbr

# lazy-load plugins with turbo mode
zinit wait lucid for \
  ael-code/zsh-colored-man-pages \
  Aloxaf/fzf-tab \
  hlissner/zsh-autopair \
  le0me55i/zsh-systemd \
  wait"1" \
    laggardkernel/zsh-thefuck \
  LucasLarson/gunstage \
  OMZP::command-not-found \
	OMZP::docker \
	OMZP::docker-compose \
  OMZP::github \
  OMZP::man \
  OMZP::transfer \
  wait"2" atload="__kitty_complete" \
    redxtech/zsh-kitty \
  redxtech/zsh-load-module \
  redxtech/zsh-not-vim \
  redxtech/zsh-unix-simple \
  unixorn/fzf-zsh-plugin \
  voronkovich/gitignore.plugin.zsh \
  zpm-zsh/ssh

# currently unused plugins
#   redxtech/zsh-show-path \
#   redxtech/zsh-tre \
#   redxtech/zsh-yup \

# distro specific plugins
local CURRENT_DISTRO="$(lsb_release -is)"
if test "$CURRENT_DISTRO" = "Arch" -o "$CURRENT_DISTRO" = "EndeavourOS" -o "$CURRENT_DISTRO" = "Garuda"; then
  zinit wait lucid for \
    OMZP::archlinux
elif test "$CURRENT_DISTRO" = "Rocky"; then
	zinit wait lucid for \
		OMZP::dnf
elif test "$CURRENT_DISTRO" = "Ubuntu"; then
  zinit wait lucid for \
    OMZP::ubuntu
fi
unset CURRENT_DISTRO

# only if notify-send
if (( $+commands[notify-send] )); then
  zinit wait lucid for \
    atload"AUTO_NOTIFY_IGNORE+=(btm btop conf docker kitty micro ranger spotifyd spt tmux yadm zsh)" \
      MichaelAquilina/zsh-auto-notify
fi

# binaries from github releases
# TODO add atclone command to move completions for all entries?
zinit wait lucid from'gh-r' as"command" for \
  mv'fd* fd' sbin'**/fd(.exe|) -> fd' \
    @sharkdp/fd \
  mv'bat* bat' sbin'**/bat(.exe|) -> bat' \
    @sharkdp/bat \
  sbin'**/exa -> exa' atclone'cp -vf completions/exa.zsh _exa' \
    ogham/exa \
  mv'rip* ripgrep' sbin'**/rg(.exe|) -> rg' \
    BurntSushi/ripgrep \
  sbin"**/bin/nvim -> nvim" bpick"nvim-linux64.tar.gz" \
    neovim/neovim \
  mv"yq* yq" sbin'**/yq(.exe|) -> yq' \
    mikefarah/yq
  
  # unused entries
  # sbin"rclone-*/rclone" bpick"*amd64.zip*" \
  #   rclone/rclone

# binaries from github repos
zinit as"command" wait lucid for \
  sbin \
    dylanaraps/neofetch \
  sbin"yadm" dl"https://gist.githubusercontent.com/redxtech/b17b1dd382d648aaba758df911cd9d54/raw/ff066be0340e7f73d7affa28bcd4da8f39538747/yadm.patch" \
  patch"yadm.patch" \
    TheLocehiliosan/yadm.git

# completions packages
zinit ice as"completion" mv"completion.zsh -> _delta" wait lucid
zinit snippet https://github.com/dandavison/delta/blob/master/etc/completion/completion.zsh
zinit wait lucid for \
  atclone"./zplug.zsh" \
    g-plane/zsh-yarn-autocompletions \
  greymd/docker-zsh-completion \
  ryutok/rust-zsh-completions

# completions, syntax highlighting, and autosuggestions
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

