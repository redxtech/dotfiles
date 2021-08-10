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

# load zinit meta plugin
zinit light redxtech/z-a-meta-plugins

# load the meta plugins
# TODO: use annexes+con
zinit skip'cargo-extensions git-open git-recent git-my git-quick-stats git-now git-extras peco skim' for \
  annexes \
  console-tools \
  ext-git \
  fuzzy \
  molovo \
  rust-utils \
  zsh-users+fast

# zsh prompt
zinit ice depth=1
zinit light romkatv/powerlevel10k

# lazy-load plugins with turbo mode
zinit wait lucid for \
  ael-code/zsh-colored-man-pages \
  Aloxaf/fzf-tab \
  hlissner/zsh-autopair \
  wait"1" \
    laggardkernel/zsh-thefuck \
  le0me55i/zsh-extract \
  LucasLarson/gunstage \
  OMZP::command-not-found \
  OMZP::copybuffer \
  OMZP::docker-compose \
  OMZP::encode64 \
  OMZP::github \
  OMZP::gpg-agent \
  OMZP::httpie \
  OMZP::man \
  OMZP::ssh-agent \
  OMZP::systemd \
  OMZP::transfer \
  OMZP::zsh_reload \
  redxtech/zsh-fzf-utils \
  wait"2" atload="__kitty_complete" \
    redxtech/zsh-kitty \
  redxtech/zsh-load-module \
  redxtech/zsh-media-sync \
  redxtech/zsh-not-vim \
  redxtech/zsh-show-path \
  redxtech/zsh-tre \
  redxtech/zsh-unix-simple \
  redxtech/zsh-yup \
  unixorn/fzf-zsh-plugin \
  voronkovich/gitignore.plugin.zsh \
  zpm-zsh/ssh

# can't load this one in turbo mode
zinit light olets/zsh-abbr

# distro specific plugins
local CURRENT_DISTRO="$(lsb_release -is)"
if test "$CURRENT_DISTRO" = "Arch" -o "$CURRENT_DISTRO" = "Garuda"; then
  zinit wait lucid for \
    redxtech/zsh-aur-install \
    OMZP::archlinux
elif test "$CURRENT_DISTRO" = "openSUSE"; then
  zinit wait lucid for \
    OMZP::suse
elif test "$CURRENT_DISTRO" = "Ubuntu"; then
  zinit wait lucid for \
    OMZP::ubuntu
elif test "$CURRENT_DISTRO" = "Debian"; then
  zinit wait lucid for \
    OMZP::debian \
    redxtech/zsh-sb-upgrade
fi
unset CURRENT_DISTRO

# only if notify-send
if (( $+commands[notify-send] )); then
  zinit wait lucid for \
    atload"AUTO_NOTIFY_IGNORE+=(btm conf docker hors kitty micro spotifyd spt tmux yadm zsh)" \
      MichaelAquilina/zsh-auto-notify
fi

# binaries from github releases
zinit wait lucid from"gh-r" as"command" for \
  sbin"zoxide-*/zoxide" dl"https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/contrib/completions/_zoxide" \
    atload"eval \"\$(zoxide init zsh)\"" \
      ajeetdsouza/zoxide \
  sbin"deploy/figurine" \
    arsham/figurine \
  sbin"deploy/rainbow" \
    atload"alias lolcat=\"rainbow\"" \
      arsham/rainbow \
  sbin"ctop" mv"ctop* -> ctop" \
    bcicen/ctop \
  sbin"dust-*/dust" \
    bootandy/dust \
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
  sbin \
    dduan/tre \
  sbin"xh-*/xh" mv"xh-*/completions/_xh -> _xh" \
    ducaale/xh \
  sbin"hub-linux-*/bin/hub" mv"hub-linux-*/etc/hub.zsh_completion -> _hub" \
    @github/hub \
  sbin mv"**/yq* -> yq" \
    mikefarah/yq \
  sbin bpick"*linux*zip" \
    ms-jpq/sad \
  sbin bpick"*linux_x86_64*" \
    muesli/duf \
  sbin"**/bin/nvim" mv"nvim* -> nvim" nocompletions \
    neovim/neovim \
  sbin \
    o2sh/onefetch \
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
  sbin"spotifyd" bpick"*linux-full*" atclone"curl https://raw.githubusercontent.com/Spotifyd/spotifyd/master/contrib/spotifyd.service --output ~/.config/systemd/user/spotifyd.service" \
    Spotifyd/spotifyd \
  sbin mv"jq-* -> jq" \
    stedolan/jq \
  sbin bpick"choose" \
    theryangeary/choose \
  sbin"sn" \
    vmchale/tin-summer \
  sbin bpick"*ubuntu*" \
    WindSoilder/hors \
  sbin bpick"*unknown-linux-gnu*" \
    XAMPPRocky/tokei \
  sbin"micro-*/micro" \
    zyedidia/micro

# binaries from github repos
zinit as"command" wait lucid for \
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

# binaries from npm
zinit wait lucid as"command" nocompletions for \
  node"!add-gitignore" id-as"add-gitignore-bin" \
    zdharma/null \
  node"!gtop" id-as"gtop-bin" \
    zdharma/null \
  node"!mklicense" id-as"mklicense-bin" \
    zdharma/null \
  node"!speed-test" id-as"speed-test-bin" \
    zdharma/null \
  node"!vtop" id-as"vtop-npm" \
    zdharma/null \
  node"!yo" id-as"yeoman-bin" \
    zdharma/null

# binaries from pip
zinit wait lucid as"command" nocompletions for \
  pip"!asciinema" id-as"asciinema-bin" \
    zdharma/null \
  pip"!thefuck" id-as"thefuck-bin" \
    zdharma/null \
  pip"wal <- !pywal -> wal" id-as"pywal-bin" \
    zdharma/null

# programs compiled with make
zinit wait lucid as"command" make"PREFIX=$ZPFX" for \
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
  ryutok/rust-zsh-completions

