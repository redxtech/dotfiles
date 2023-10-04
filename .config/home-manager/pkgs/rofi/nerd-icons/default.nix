{ pkgs ? import <nixpkgs> {}
, lib ? pkgs.lib
, writeShellApplication ? pkgs.writeShellApplication
, writeText ? pkgs.writeText
, useWayland ? false
}:

let
  nerd-icon-list = writeText "nerd-icon-list" (builtins.readFile ./nerd-icons.txt);
in 
with pkgs; with lib; writeShellApplication {
  name = "rofi-nerd-icons";
  runtimeInputs = [ coreutils rofi (if useWayland then wl-clipboard else xclip) ];

  text = ''
  main () {
    rofi -dmenu -matching glob -p "Icon 󰄾" <${nerd-icon-list} \
    | awk '{print $1}' \
    | tr -d '\n' \
    | ${ if useWayland then "wl-copy" else "xclip -selection clipboard" }
  }

  main
  '';

  meta = with lib; {
    description = "Copy nerd icons to clipboard";
    platforms = with platforms; linux;
  };
}
