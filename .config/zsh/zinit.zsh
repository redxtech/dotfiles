#!/usr/bin/env zsh

# install zinit if it isn't already installed
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

# load zinit
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# load a few important annexes, without turbo
zinit light-mode for \
  zinit-zsh/z-a-rust \
  zinit-zsh/z-a-as-monitor \
  zinit-zsh/z-a-patch-dl \
  zinit-zsh/z-a-bin-gem-node

# zsh prompt
# zinit load redxtech/zshred
# zinit load ~/Code/zshred
zinit ice depth=1
zinit light romkatv/powerlevel10k

# distro specific plugins
CURRENT_DISTRO="$(lsb_release -is)"
if test "$CURRENT_DISTRO" = "Arch" -o "$CURRENT_DISTRO" = "Garuda"; then
  zinit ice wait lucid
  zinit snippet OMZP::archlinux
elif test "$CURRENT_DISTRO" = "openSUSE"; then
  zinit ice wait lucid
  zinit snippet OMZP::suse
fi
unset CURRENT_DISTRO

# lazy-load plugins with turbo mode
zinit wait lucid for \
  ael-code/zsh-colored-man-pages \
  Aloxaf/fzf-tab \
  ajeetdsouza/zoxide \
  axtl/gpg-agent.zsh \
  laggardkernel/zsh-thefuck \
  le0me55i/zsh-extract \
  MenkeTechnologies/zsh-cargo-completion \
  MichaelAquilina/zsh-auto-notify \
  MichaelAquilina/zsh-emojis \
  redxtech/zsh-aur-install \
  redxtech/zsh-fzf-utils \
  redxtech/zsh-not-vim \
  redxtech/zsh-unix-simple \
  Tarrasch/zsh-bd \
  Tarrasch/zsh-colors \
  voronkovich/gitignore.plugin.zsh \

# currently disabled plugins
# zpm-zsh/tmux

# git library for themes and completions
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::git.zsh

# oh-my-zsh plugins (single file plugins only)
zinit wait lucid for \
  OMZP::command-not-found \
  OMZP::copybuffer \
  OMZP::docker-compose \
  OMZP::encode64 \
  OMZP::httpie \
  OMZP::keychain \
  OMZP::man \
  OMZP::pip \
  OMZP::ssh-agent \
  OMZP::systemd \
  OMZP::transfer \
  OMZP::zsh_reload

# oh-my-zsh plugins with full directory
zinit ice svn wait lucid
zinit snippet OMZP::gitfast

# can't load this one in turbo mode
zinit light olets/zsh-abbr

# git-fuzzy bin file
zinit as"null" wait lucid for \
  sbin"bin/git-fuzzy" \
    bigH/git-fuzzy

# binaries from github releases
zinit ice wait lucid from"gh-r" as"program"
zinit load sei40kr/fast-alias-tips-bin
zinit ice wait lucid
zinit load sei40kr/zsh-fast-alias-tips

zinit ice wait lucid from"gh-r" as"program"
zinit load junegunn/fzf
zinit ice wait lucid from"gh-r" as"program" pick"bin/dog"
zinit load ogham/dog

zinit wait lucid from"gh-r" as"program" bpick"*linux_x86_64.tar.*" for \
  charmbracelet/glow

# pull in some crates
crates=(bottom hors zoxide)
zinit ice id-as"crates-bin" rustup cargo"${(j.;.)crates}" as"command" pick"bin/*"
zinit light zdharma/null
unset crates

# zinit as"null" lucid from"gh-r" for \
  # mv"exa* -> exa" sbin ogham/exa \
  # mv"fd* -> fd" sbin"fd/fd" @sharkdp/fd \
  # sbin"fzf" junegunn/fzf-bin
# TODO: use zinit to load npm packages here

# completions
zinit ice as"completion" wait lucid
zinit snippet OMZP::docker/_docker
zinit ice as"completion" wait lucid
zinit snippet OMZP::docker-compose/_docker-compose
zinit ice as"completion" wait lucid
zinit snippet OMZP::fd/_fd
zinit ice as"completion" wait lucid
zinit snippet OMZP::ripgrep/_ripgrep
zinit ice atclone'./zplug.zsh' wait lucid
zinit light g-plane/zsh-yarn-autocompletions

# autocompletion, syntax highlighting, and autosuggestions
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# history substring search
zinit ice wait lucid atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[[B' history-substring-search-down"
zinit load zsh-users/zsh-history-substring-search

