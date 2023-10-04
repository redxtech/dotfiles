{ config, pkgs, lib, ... }:

{
  imports = [
    ./bspwm.nix
    ./desktop-apps.nix
    ./dunst.nix
    ./kitty.nix
    ./mopidy.nix
    ./picom.nix
    ./polybar.nix
    ./rio.nix
    ./rofi.nix
    ./services.nix
    ./sxhkd.nix
    ./theme.nix
  ];

  xsession = {
    enable = true;
  };
}

