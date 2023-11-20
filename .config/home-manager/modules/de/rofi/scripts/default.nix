{ config, pkgs, lib, ... }:

{
  rofi-clipboard = pkgs.callPackage ./clipboard { };
  rofi-powermenu = pkgs.callPackage ./powermenu {
    useHostLocker = !config.device-vars.isNixOS;
  };
  rofi-screenshot = pkgs.callPackage ./screenshot { };
  rofi-web = pkgs.callPackage ./web { };
  rofi-youtube = pkgs.callPackage ./youtube { };
}

