{ config, pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    # audacity
    discord
    # firefox
    mercury-browser
    multiviewer-for-f1
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
