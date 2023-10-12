{ config, pkgs, lib, ... }:

{
  services.mopidy = {
    enable = true;

    extensionPackages = with pkgs; [
      mopidy-iris
      mopidy-local
      mopidy-mpd
      mopidy-mpris
      mopidy-scrobbler
      mopidy-spotify
    ];

    settings = {
      iris = {
        country = "CA";
        locale = "en_CA";
      };
      mpd = {
        enabled = true;
        hostname = "::";
      };
      spotify = {
        enabled = true;
        bitrate = 320;
        search_artist_count = 20;
      };
      tidal = {
        enabled = true;
        quality = "LOSSLESS";
      };
    };

    extraConfigFiles =
      [ "${config.xdg.configHome}/mopidy/mopidy-secrets.conf" ];
  };

  homeage.file."mopidy" = {
    source = ../secrets/mopidy-secrets.conf.age;
    symlinks = [ "${config.xdg.configHome}/mopidy/mopidy-secrets.conf" ];
  };
}
