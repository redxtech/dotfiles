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
  sileht/z-a-bin-gem-node
  # zinit-zsh/z-a-bin-gem-node

# zsh prompt
zinit ice depth=1
zinit light romkatv/powerlevel10k

# distro specific plugins
local CURRENT_DISTRO="$(lsb_release -is)"
if test "$CURRENT_DISTRO" = "Arch" -o "$CURRENT_DISTRO" = "Garuda"; then
  zinit ice wait lucid
  zinit load redxtech/zsh-aur-install
  zinit ice wait lucid
  zinit snippet OMZP::archlinux
elif test "$CURRENT_DISTRO" = "openSUSE"; then
  zinit ice wait lucid
  zinit snippet OMZP::suse
elif test "$CURRENT_DISTRO" = "Ubuntu"; then
  zinit ice wait lucid
  zint load OMZP::ubuntu
fi
unset CURRENT_DISTRO

# lazy-load plugins with turbo mode
zinit wait lucid for \
  ael-code/zsh-colored-man-pages \
  Aloxaf/fzf-tab \
  asdf-vm/asdf \
  hlissner/zsh-autopair \
  laggardkernel/zsh-thefuck \
  le0me55i/zsh-extract \
  LucasLarson/gunstage \
  MenkeTechnologies/zsh-cargo-completion \
  atload"AUTO_NOTIFY_IGNORE+=(btm conf hors kitty micro spotifyd spt tmux yadm zsh)" \
    MichaelAquilina/zsh-auto-notify \
  MichaelAquilina/zsh-emojis \
  blockf dl"https://raw.githubusercontent.com/asdf-vm/asdf/master/completions/_asdf" \
    redxtech/zsh-asdf-direnv \
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
  OMZP::gpg-agent \
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

# binaries from github releases
zinit wait lucid from"gh-r" as"program" for \
  sbin"zoxide-*/zoxide" dl"https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/contrib/completions/_zoxide" \
  atload"eval \"\$(zoxide init zsh)\"" \
      ajeetdsouza/zoxide \
  sbin"ctop" mv"ctop* -> ctop" \
    bcicen/ctop \
  sbin"dust-*/dust" \
    bootandy/dust \
  sbin"ripgrep-*/rg" mv"ripgrep-*/complete/_rg -> _rg" \
    BurntSushi/ripgrep \
  sbin \
    atload"eval \"\$(mcfly init zsh)\"" \
      cantino/mcfly \
  sbin \
    casey/just \
  sbin"glow" bpick"*linux_x86_64.tar*" \
    charmbracelet/glow \
  sbin mv"sd-* -> sd" \
    chmln/sd \
  sbin"btm" \
    ClementTsang/bottom \
  sbin bpick"*lnx*" \
    dalance/procs \
  sbin"delta-*/delta" \
    dandavison/delta \
  sbin"tldr" mv"tldr* -> tldr" dl"https://raw.githubusercontent.com/dbrgn/tealdeer/master/zsh_tealdeer -> _tldr" \
    dbrgn/tealdeer \
  sbin"xh-*/xh" mv"xh-*/completions/_xh -> _xh" \
    ducaale/xh \
  sbin"hub-linux-*/bin/hub" mv"hub-linux-*/etc/hub.zsh_completion -> _hub" \
    @github/hub \
  sbin \
    jesseduffield/lazydocker \
  sbin \
    junegunn/fzf \
  sbin bpick"*linux*zip" \
    ms-jpq/sad \
  sbin bpick"*linux_x86_64*" \
    muesli/duf \
  sbin"pueu(e|ed)" bpick"pueue-linux-x86_64" bpick"pueued-linux-x86_64" mv"pueue-* -> pueue" cp"pueued-* -> pueued" \
    Nukesor/pueue \
  sbin \
    o2sh/onefetch \
  sbin"bin/exa" mv"completions/exa.zsh -> _exa" \
    ogham/exa \
  sbin"bin/dog" mv"completions/dog.zsh -> _dog" \
    ogham/dog \
  sbin \
    orf/gping \
  sbin \
    pemistahl/grex \
  sbin"rclone-*/rclone" bpick"*amd64.zip*" \
    rclone/rclone \
  sbin"spt" \
    Rigellute/spotify-tui \
  sbin bpick"*linux_amd64.tar*" \
    rs/curlie \
  sbin"bat-*/bat" mv"bat-*/autocomplete/bat.zsh -> _bat" \
    @sharkdp/bat \
  sbin"diskus-*/diskus" \
    @sharkdp/diskus \
  sbin"hyperfine-*/hyperfine" \
    @sharkdp/hyperfine \
  sbin"fd-*/fd" \
    @sharkdp/fd \
  sbin"vivid-*/vivid" \
    @sharkdp/vivid \
  sbin"spotifyd" bpick"*linux-full*" atclone"curl https://raw.githubusercontent.com/Spotifyd/spotifyd/master/contrib/spotifyd.service --output ~/.config/systemd/user/spotifyd.service" \
    Spotifyd/spotifyd \
  sbin mv"jq-* -> jq" \
    stedolan/jq \
  sbin bpick"choose" \
    theryangeary/choose \
  sbin"coreutils-*/coreutils" \
    uutils/coreutils \
  sbin"sn" \
    vmchale/tin-summer \
  sbin bpick"*ubuntu*" \
    WindSoilder/hors \
  sbin bpick"*unknown-linux-gnu*" \
    XAMPPRocky/tokei \
  sbin"micro-*/micro" \
    zyedidia/micro

# binaries from github repos
zinit as"program" wait lucid for \
  sbin"bin/git-fuzzy" \
    bigH/git-fuzzy \
  sbin \
    denilsonsa/prettyping \
  sbin \
    dylanaraps/neofetch \
  sbin \
    elasticdog/transcrypt \
  sbin \
    funtoo/keychain \
  sbin \
    LuRsT/hr \
  sbin"yadm" dl"https://gist.githubusercontent.com/redxtech/b17b1dd382d648aaba758df911cd9d54/raw/ff066be0340e7f73d7affa28bcd4da8f39538747/yadm.patch" \
  patch"yadm.patch" \
    TheLocehiliosan/yadm.git

# install and expose rust via rustup
zinit ice id-as"rustup" rustup as"program" sbin"bin/*" \
  atload"export CARGO_HOME=\$PWD RUSTUP_HOME=\$PWD/rustup"
zinit light zdharma/null

# binaries from npm
zinit wait lucid as"program" for \
  node"!add-gitignore" id-as"add-gitignore-bin" \
    zdharma/null \
  node"carbon-now <- !carbon-now-cli -> carbon-now" id-as"carbon-now-bin" \
    zdharma/null \
  node"!gtop" id-as"gtop-bin" \
    zdharma/null \
  node"!mklicense" id-as"mklicense-bin" \
    zdharma/null \
  node"!speed-test" id-as"speed-test-bin" \
    zdharma/null \
  node"!yo" id-as"yeoman-bin" \
    zdharma/null

zinit wait lucid as"program" for \
  pip"!asciinema" id-as"asciinema-bin" \
    zdharma/null \
  pip"wal <- !pywal -> wal" id-as"pywal-bin" \
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

