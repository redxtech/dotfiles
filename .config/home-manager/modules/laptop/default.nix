{ config, pkgs, lib, ... }:

{
  imports = [ ../de ./device-vars.nix ./polybar.nix ./bspwm.nix ];

  xdg.configFile."wireplumber/main.lua.d/51-alsa-rename.lua".text = ''
    table.insert(alsa_monitor.rules, {
      matches = { { { "node.name", "matches", "alsa_output.pci-0000_00_1f.3.*" } } },
      apply_properties = { ["node.description"] = "Speakers" },
    })
  '';
}
