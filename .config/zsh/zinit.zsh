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
  redxtech/zsh-show-path \
  redxtech/zsh-unix-simple \
  Tarrasch/zsh-bd \
  Tarrasch/zsh-colors \
  unixorn/fzf-zsh-plugin \
  voronkovich/gitignore.plugin.zsh \
  wfxr/forgit \
  zdharma/zui \
  zinit-zsh/zinit-console \
  zpm-zsh/ssh

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
  sbin"ripgrep-*/rg" \
    BurntSushi/ripgrep \
  sbin"glow" bpick"*linux_x86_64.tar*" \
    charmbracelet/glow \
  sbin"btm" \
    ClementTsang/bottom \
  sbin"delta-*/delta" \
    dandavison/delta \
  sbin"tldr" mv"tldr* -> tldr" dl"https://raw.githubusercontent.com/dbrgn/tealdeer/master/zsh_tealdeer -> _tldr" \
    dbrgn/tealdeer \
  sbin"hub-linux-*/bin/hub" mv"hub-linux-*/etc/hub.zsh_completion -> _hub" \
    @github/hub \
  sbin \
    junegunn/fzf \
  sbin bpick"*linux*zip" \
    ms-jpq/sad \
  sbin"bin/exa" mv"completions/exa.zsh -> _exa" \
    ogham/exa \
  sbin"bin/dog" mv"completions/dog.zsh -> _dog" \
    ogham/dog \
  sbin"spt" \
    Rigellute/spotify-tui \
  sbin"bat-*/bat" mv"bat-*/autocomplete/bat.zsh -> _bat" \
    @sharkdp/bat \
  sbin"diskus-*/diskus" \
    @sharkdp/diskus \
  sbin"fd-*/fd" \
    @sharkdp/fd \
  sbin"spotifyd" bpick"*linux-full*" atclone"curl https://raw.githubusercontent.com/Spotifyd/spotifyd/master/contrib/spotifyd.service --output ~/.config/systemd/user/spotifyd.service" \
    Spotifyd/spotifyd \
  sbin mv"ffsend-* -> ffsend" dl"https://raw.githubusercontent.com/timvisee/ffsend/master/contrib/completions/_ffsend" \
    timvisee/ffsend \
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
    elasticdog/transcrypt \
  sbin \
    LuRsT/hr \
  sbin \
    pipeseroni/pipes.sh \
  sbin"yadm" dl"https://gist.githubusercontent.com/redxtech/b17b1dd382d648aaba758df911cd9d54/raw/4cebf29c7580e9a5add66c17e34c7a563c342ffd/yadm.patch" \
  patch"yadm.patch" \
    TheLocehiliosan/yadm.git

# binaries from npm
zinit wait lucid as"program" for \
  node"!mklicense" id-as"mklicense-bin" \
    zdharma/null

# programs compiled with make
zinit wait lucid as"program" make"PREFIX=$ZPFX" for \
  sbin"figlet" mv"fonts -> $HOME/.local/share/figletfonts" make"DEFAULTFONTDIR=$HOME/.local/share/figletfonts" \
    cmatsuoka/figlet \
  sbin"pv" atclone"./configure" atpull"%atclone" \
    icetee/pv \
  sbin \
    Xfennec/progress

# completions packages
zinit ice as"completion" wait lucid
zinit snippet https://raw.githubusercontent.com/gantsign/zsh-plugins/master/ctop/_ctop
zinit ice as"completion" wait lucid
zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/pip/_pip
zinit ice as"completion" mv"completion.zsh -> _delta" wait lucid
zinit snippet https://github.com/dandavison/delta/blob/master/etc/completion/completion.zsh
zinit wait lucid nocd depth=1 \
    atinit"ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true" for \
      3v1n0/zsh-bash-completions-fallback
zinit wait lucid for \
  atclone"./zplug.zsh" \
    g-plane/zsh-yarn-autocompletions \
  greymd/docker-zsh-completion \
  pkulev/zsh-rustup-completion

# add these extra completions to path (nocompletions) instead of to .zinit/completions (dont override existing completions)
zinit ice lucid nocompile wait'0e' nocompletions
zinit load MenkeTechnologies/zsh-more-completions

# TODO: missing completions
# - glow
# - tin-summer (sn)
# - diskus
# - sad
# - hr
# - pv
# - figlet

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

