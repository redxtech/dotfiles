{ config, pkgs, lib, ... }:

{
  homeage = {
    identityPaths = [ "~/.ssh/id_ed25519" ];

    installationType = "systemd";

    file = {
      "bw" = {
        source = ./secrets/bw.txt.age;
        symlinks = [ "${config.xdg.configHome}/zsh/env/bw.txt" ];
      };

      "mopidy" = {
        source = ./secrets/mopidy-secrets.conf.age;
        symlinks = [ "${config.xdg.configHome}/mopidy/mopidy-secrets.conf" ];
      };

      "openweathermap-api" = {
        source = ./secrets/openweathermap.txt.age;
        symlinks = [ "${config.xdg.configHome}/polybar/openweathermap.txt" ];
      };

      "spotify" = {
        source = ./secrets/spotify.txt.age;
        symlinks = [ "${config.xdg.configHome}/spotify-tui/spotify.txt" ];
      };

      "youtube" = {
        source = ./secrets/youtube.txt.age;
        symlinks = [ "${config.xdg.configHome}/rofi/youtube.txt" ];
      };
    };

  };
}
