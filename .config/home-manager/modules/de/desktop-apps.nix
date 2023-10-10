{ config, pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    # audacity
    discord
    # firefox
    mercury-browser
    neovide
    pavucontrol
    slack
    spotifywm
    xfce.thunar
    xfce.thunar-volman
    vlc
  ];

  programs = {
    feh = { enable = false; };
    mpv = { enable = false; };
  };
}
