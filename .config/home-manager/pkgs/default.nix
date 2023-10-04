self: super:

{
  copy-spotify-url = super.callPackage ./scripts/copy-spotify-url {};
  # mercury-browser = super.callPackage ./mercury-browser {};
  pipewire-control = super.callPackage ./scripts/pipewire-control {};
  pipewire-output-tail = super.callPackage ./scripts/pipewire-output-tail {};
  player-mpris-tail = super.callPackage ./scripts/player-mpris-tail {};
  polywins = super.callPackage ./scripts/polywins {};
  resize-aspect = super.callPackage ./scripts/resize-aspect {};
  rofi-clipboard = super.callPackage ./rofi/clipboard {};
  rofi-powermenu = super.callPackage ./rofi/powermenu {};
  rofi-screenshot = super.callPackage ./rofi/screenshot {};
  rofi-web = super.callPackage ./rofi/web {};
  rofi-youtube = super.callPackage ./rofi/youtube {};
  slurm = super.callPackage ./slurm {};
  switchup = super.callPackage ./switchup {};
  updates-available-arch = super.callPackage ./scripts/updates-available-arch {};
  updates-install-arch = super.callPackage ./scripts/updates-install-arch {};
  vimix-cursor-theme = super.callPackage ./vimix-cursor-theme {};
  weather-bar = super.callPackage ./scripts/weather-bar {};
}
