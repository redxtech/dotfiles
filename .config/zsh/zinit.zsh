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
  zinit load redxtech/zsh-aur-install
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
  ajeetdsouza/zoxide \
  Aloxaf/fzf-tab \
  asdf-vm/asdf \
  axtl/gpg-agent.zsh \
  hlissner/zsh-autopair \
  laggardkernel/zsh-thefuck \
  le0me55i/zsh-extract \
  MenkeTechnologies/zsh-cargo-completion \
  atload"AUTO_NOTIFY_IGNORE+=(btm conf hors spotifyd spt yadm)" \
    MichaelAquilina/zsh-auto-notify \
  MichaelAquilina/zsh-emojis \
  redxtech/zsh-fzf-utils \
  redxtech/zsh-not-vim \
  redxtech/zsh-unix-simple \
  Tarrasch/zsh-bd \
  Tarrasch/zsh-colors \
  unixorn/fzf-zsh-plugin \
  voronkovich/gitignore.plugin.zsh \
  zdharma/zui \
  zinit-zsh/zinit-console

# oh-my-zsh plugins (single file plugins only)
zinit wait lucid for \
  OMZP::command-not-found \
  OMZP::copybuffer \
  OMZP::docker-compose \
  OMZP::encode64 \
  OMZP::github \
  OMZP::httpie \
  OMZP::keychain \
  OMZP::man \
  OMZP::pip \
  OMZP::systemd \
  OMZP::transfer \
  OMZP::zsh_reload

# can't load this one in turbo mode
zinit light olets/zsh-abbr

# fast alias tips
zinit ice wait lucid from"gh-r" as"program"
zinit load sei40kr/fast-alias-tips-bin
zinit ice wait lucid
zinit load sei40kr/zsh-fast-alias-tips

# install and expose rust via rustup
zinit ice id-as"rustup" rustup as"command" sbin"bin/*" \
  atload"export CARGO_HOME=\$PWD RUSTUP_HOME=\$PWD/rustup"
zinit light zdharma/null

# binaries from github releases
zinit wait lucid from"gh-r" as"program" for \
  sbin"zoxide-*/zoxide" id-as"zoxide-bin" \
    ajeetdsouza/zoxide \
  sbin"ctop" mv"ctop* -> ctop" \
    bcicen/ctop \
  sbin"glow" bpick"*linux_x86_64.tar*" \
    charmbracelet/glow \
  sbin"btm" \
    ClementTsang/bottom \
  sbin"tldr" mv"tldr* -> tldr" \
    dbrgn/tealdeer \
  sbin"hub-linux-*/bin/hub" \
    @github/hub \
  sbin \
    junegunn/fzf \
  sbin"bin/dog" \
    ogham/dog \
  sbin"spt" \
    Rigellute/spotify-tui \
  sbin"spotifyd" bpick"*linux-full*" atclone"curl https://raw.githubusercontent.com/Spotifyd/spotifyd/master/contrib/spotifyd.service --output ~/.config/systemd/user/spotifyd.service" \
    Spotifyd/spotifyd \
  sbin"sn" \
    vmchale/tin-summer \
  sbin bpick"*ubuntu*" \
    WindSoilder/hors

# binaries from github repos
zinit as"command" wait lucid for \
  sbin"bin/git-fuzzy" \
    bigH/git-fuzzy \
  sbin \
    denilsonsa/prettyping \
  sbin \
    pipeseroni/pipes.sh

# programs compiled with make
zinit wait lucid as"program" make"PREFIX=$ZPFX" for \
  sbin \
    Xfennec/progress

# completions from github releases
zinit wait lucid from"gh-r" as"completion" for \
  ClementTsang/bottom \
  ogham/dog

# completions from oh-my-zsh
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

