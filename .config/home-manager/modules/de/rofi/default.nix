{ config, pkgs, lib, ... }:

let
  colours = [ "blue" "cyan" "green" "orange" "red" "yellow" ];
  colourMods = builtins.listToAttrs (map (colour: {
    name = "rofi/themes/${colour}.rasi";
    value = {
      text = ''
        @theme "custom"

        * {
          bg1: @${colour};
        }
      '';
    };
  }) colours);

  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;

    font = "DankMono Nerd Font 14";

    terminal = "${pkgs.kitty}/bin/kitty";

    plugins = with pkgs; [
      rofi-bluetooth
      rofi-calc
      rofi-emoji
      rofi-rbw
      rofi-screenshot
      rofi-systemd
      rofi-vpn
    ];

    theme = {
      configuration = {
        modi = "run,drun,ssh";
        show-icons = true;
        icon-theme = "Papirus-Dark";
        drun-display-format = "{icon} {name}";
        # matching = "fuzzy";
        # disable-history = false;
        hide-scrollbar = true;
        steal-focus = true;
        window-format = "{c} {t}";
      };
      "*" = with config.user-theme; {
        bg0 = mkLiteral bg;
        bg1 = mkLiteral purple;
        bg2 = mkLiteral bg-alt;
        bg3 = mkLiteral blue;
        fg0 = mkLiteral fg;
        fg1 = mkLiteral bg;

        blue = mkLiteral blue;
        cyan = mkLiteral cyan;
        green = mkLiteral green;
        orange = mkLiteral orange;
        purple = mkLiteral purple;
        red = mkLiteral red;
        yellow = mkLiteral yellow;
      };
      window = {
        transparency = "real";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg0";
        width = mkLiteral "35%";
        orientation = mkLiteral "vertical";
      };
      prompt = {
        enabled = false;
        background-color = mkLiteral "@bg0";
      };
      button = {
        action = "ok";
        str = " ";
        expand = false;
        text-color = mkLiteral "@bg3";
        background-color = mkLiteral "transparent";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };
      entry = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg0";
        expand = true;
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0";
        placeholder-markup = true;
        placeholder = "Search...";
        placeholder-color = mkLiteral "@bg3";
      };
      entry-wrapper = {
        orientation = mkLiteral "horizontal";
        margin = mkLiteral "0px 0px 0px 10px";
        spacing = mkLiteral "16px";
        vertical-align = mkLiteral "0.5";
        background-color = mkLiteral "transparent";
        children = mkLiteral "[ button, entry ]";
      };
      inputbar = {
        padding = mkLiteral "14px";
        margin = mkLiteral "10px 10px 0px 10px";
        background-color = mkLiteral "@bg0";
        expand = false;
        border-radius = mkLiteral "5px";
        position = mkLiteral "north";
        children = mkLiteral "[ entry-wrapper ]";
      };
      listview = {
        background-color = mkLiteral "@bg0";
        border-radius = mkLiteral "5px";
        cycle = true;
        dynamic = true;
        columns = mkLiteral "2";
        lines = mkLiteral "5";
        spacing = mkLiteral "0";
        margin = mkLiteral "10px 10px 10px 10px";
      };
      mainbox = {
        background-color = mkLiteral "@bg1";
        border-radius = mkLiteral "10px";
        border = mkLiteral "2px";
        border-color = mkLiteral "none";
        padding = mkLiteral "14px";
        spacing = mkLiteral "12px";
        expand = true;
        width = mkLiteral "200px";
        children = mkLiteral "[ inputbar, listview ]";
        hightlight = mkLiteral "italic";
      };
      element = {
        background-color = mkLiteral "transparent";
        border-radius = mkLiteral "5px";
        orientation = mkLiteral "horizontal";
        padding = mkLiteral "10px 0px 10px 12px";
      };
      element-text = {
        expand = true;
        horizontal-align = mkLiteral "0";
        vertical-align = mkLiteral "0.5";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
      };
      element-icon = {
        size = mkLiteral "1.8em";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "transparent";
        vertical-align = mkLiteral "0.5";
      };
      "element normal, element alternate" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg0";
      };
      "element selected" = {
        background-color = mkLiteral "@bg2";
        text-color = mkLiteral "@green";
        border = mkLiteral "0 0 0 3px";
        border-color = mkLiteral "@green";
        border-radius = mkLiteral "2px 5px 5px 2px";
      };
    };
  };

  xdg.dataFile = colourMods // {
    "rofi/themes/powermenu.rasi".text = ''
      @import "custom"

      configuration {
        show-icons: false;
      }

      window {
        width: 15%;
      }

      listview {
        columns: 1;
        lines: 6;
      }

      inputbar {
        enabled: false;
      }

      element-text {
        font: "DankMono Nerd Font 22";
      }
    '';

    "rofi/themes/confirm-menu.rasi".text = ''
      @import "custom"

      configuration {
        show-icons: false;
      }

      window {
        width: 11%;
      }

      listview {
        columns: 1;
        lines: 2;
      }

      inputbar {
        background-color: @bg1;
        enabled: false;
      }

      button {
        str: "Are you sure?";
        text-color: @fg0;
        background-color: @bg1;
      }

      entry {
        enabled: false;
      }
    '';

    "rofi/themes/emoji.rasi".text = ''
      @import "custom"

      configuration {
        show-icons: false;
        matching: "normal";
      }

      listview {
        columns: 3;
      }
    '';

    "rofi/themes/rofi.rasi".text = ''
      @import "custom"

      configuration {
        kb-element-next: "Tab,Super+Tab";
        kb-element-prev: "ISO_Left_Tab,Super+ISO_Left_Tab";
        window {
          format: " {c}";
        }
      }

      listview {
        columns: 1;
      }

      element-text {
        padding: 0px 0px 0px 9px;
      }

      inputbar {
        enabled: false;
      }
    '';

    "rofi/themes/sxhkd-cheatsheet.rasi".text = ''
      @theme "custom"

      listview {
        border: 0;
        columns: 1;
        scrollbar: false;
      }
    '';
  };
}

