{ config, pkgs, lib, ... }:

{
  imports = [
    ../de
    ./bspwm.nix
    # ./desktop-apps.nix
    ./device-vars.nix
    ./mopidy.nix
    ./picom.nix
    ./polybar.nix
  ];

  programs = {
    autorandr = {
      enable = true;

      profiles = {
        desktop = {
          config = {
            "DisplayPort-0" = {
              mode = "2560x1440";
              rate = "144.00";
              position = "0x0";
              primary = true;
            };
            "DisplayPort-1" = {
              mode = "2560x1440";
              rate = "144.00";
              position = "2560x0";
              crtc = 1;
              primary = false;
            };
          };
          # hooks = {
          #   postswitch = {
          #     "background" = "${config.home.homeDirectory}/.fehbg";
          #     "polybar" = "${config.xdg.configHome}/polybar/launch.sh";
          #   };
          # };
          fingerprint = {
            "DisplayPort-0" =
              "00ffffffffffff004c2d7a70523044302b1e0104b53c22783b6eb5ae4f46a626115054bfef80714f810081c081809500a9c0b300010198e200a0a0a0295008403500ba892100001a000000fd003090d6d63b010a202020202020000000fc004c433237473578540a20202020000000ff00484e4d4e4130323030380a20200195020327f144903f1f042309070783010000e305c0006d1a000002013090000000000000e3060501565e00a0a0a029503020350055502100001a6fc200a0a0a055503020350055502100001a5a8780a070384d403020350055502100001a023a801871382d40582c450055502100001e000000000000000000000000000000004f";
            "DisplayPort-1" =
              "00ffffffffffff0006b3b1275b3601002a1b0104a53c227806ee91a3544c99260f505421080001010101010101010101010101010101565e00a0a0a029503020350056502100001a000000ff002341534f4775634b5271682f64000000fd001ea522f040010a202020202020000000fc00524f4720504732373851520a200124020312412309070183010000654b040001015a8700a0a0a03b503020350056502100001a5aa000a0a0a046503020350056502100001a6fc200a0a0a055503020350056502100001a22e50050a0a0675008203a0056502100001e1c2500a0a0a011503020350056502100001a42f80050a0a0135008203a0056502100001e00a5";
          };
        };
      };
    };
  };

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
