{ pkgs ? import <nixpkgs> { }, lib ? pkgs.lib
, writeShellApplication ? pkgs.writeShellApplication, useWayland ? false }:

with pkgs;
with lib;
writeShellApplication {
  name = "copy-spotify-url";
  runtimeInputs = [
    choose
    coreutils
    playerctl
    ripgrep
    (if useWayland then wl-clipboard else xclip)
  ];

  text = ''
    main () {
      local player="''${1:-spotify}"

      playerctl --player="$player" metadata \
      | rg 'xesam:url' \
      | choose 2 \
      | tr  -d '\n' \
      | ${if useWayland then "wl-copy" else "xclip -selection clipboard"}
    }

    main "$@"
  '';

  meta = with lib; {
    description = "Copy the current Spotify URL to the clipboard";
    platforms = with platforms; linux ++ darwin;
    license = licenses.mit;
  };
}
