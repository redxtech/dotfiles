{ config, pkgs, lib, ... }:

{
  imports = [
    ../de
    ./bspwm.nix
    ./device-vars.nix
    ./mopidy.nix
    ./picom.nix
    ./polybar.nix
  ];

  # set home-manager to add home-manager paths to the user's profile
  targets.genericLinux.enable = true;

  # rename wireplumber devices
  xdg.configFile."wireplumber/main.lua.d/51-alsa-rename.lua".text = ''
    table.insert(alsa_monitor.rules, {
      matches = { { { "node.name", "matches", "alsa_output.usb-Schiit_Audio_Schiit_Unison_Modi_Multi_2-00.*" } } },
      apply_properties = { ["node.description"] = "Schiit Stack" },
    })

    table.insert(alsa_monitor.rules, {
      matches = { { { "node.name", "matches", "alsa_output.pci-0000_2e_00*" } } },
      apply_properties = { ["node.description"] = "Speakers" },
    })

    table.insert(alsa_monitor.rules, {
      matches = { { { "node.name", "matches", "alsa_output.usb-SteelSeries_SteelSeries_Arctis_7-00*stereo-game*" } } },
      apply_properties = { ["node.description"] = "Arctis 7 Game" },
    })

    table.insert(alsa_monitor.rules, {
      matches = { { { "node.name", "matches", "alsa_output.usb-SteelSeries_SteelSeries_Arctis_7-00*mono-chat*" } } },
      apply_properties = { ["node.description"] = "Arctis 7 Chat" },
    })
  '';
}
