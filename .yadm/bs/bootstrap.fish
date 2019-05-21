# Run the setup from a fish shell.
echo In the fish shell!

# Store distro as variable.
set -l DISTRO (cat /etc/os-release | grep \^ID= | tr -d ID=)

echo Current distribution: $DISTRO

echo Running pre-install scripts...

source $HOME/.yadm/bs/pre-install.fish
source $HOME/.yadm/bs/$DISTRO/pre-install.fish

echo Installing packages from system package manager...

set -l PACKAGES_BASE cowsay docker docker-compose fish fzf gitflow-avh htop libwebp neovim openssh p7zip pacaur pakku pkgfile rclone rsync screenfetch thefuck time tldr wget yadm-git yay
set -l PACKAGES_DESKTOP adobe-source-sans-pro-fonts aircrack-ng alacritty alacritty-terminfo atom awesome bitwarden calibre chromium-widevine code darkaudacity-git discord dolphin dolphin-megasync-git drill-search-git ffmpeg-full firefox firefox-developer-edition flac flameshot gimp gnome-terminal google-chrome gparted guake hyper inkscape jdownloader2 jetbrains-toolbox lastfm libreoffice-fresh mediainfo megasync mktorrent mktorrent octave openvpn otf-fira-code otf-fira-mono otf-fira-sans p7zip-gui plex-media-player postman pymedusa qbittorrent qdirstat sddm sddm-kcm sharenix-git spotify sublime-text synergy teamviewer thunderbird ttf-bitstream-vera ttf-emojione-color ttf-humor-sans ttf-ms-fonts ttf-roboto ttf-roboto-mono ttf-roboto-mono-powerline-git ttf-twemoji-color ttf-ubuntu-font-family vectr vivaldi vivaldi-ffmpeg-codecs vivaldi-snapshot vivaldi-snapshot-ffmpeg-codecs vlc wine yubico-yubioauth-desktio yubikey-manager yubikey-manager-qt yubikey-personalization-gui
set -l PACKAGES_MAIN handbrake jackett lutris plex-media-server radarr sonarr steam

# Choose proper package list.
set -l PACKAGES $PACKAGES_BASE
source $HOME/.yadm/bs/functions/read.fish
if read_desktop
  set PACKAGES $PACKAGES $PACKAGES_DESKTOP
end
if read_main
  set PACKAGES $PACKAGES $PACKAGES_MAIN
end

# Install packages based on distro.
if $DISTRO == arch
  pacaur -Syu $PACKAGES
else if $DISTRO == ubuntu
  sudo apt update
  sudo apt install $PACKAGES
fi

echo Running post-install scripts...

source $HOME/.yadm/bs/post-install.fish
source $HOME/.yadm/bs/$DISTRO/post-install.fish

echo Bootstrapping completed!

screenfetch

