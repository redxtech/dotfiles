{ config, pkgs, lib, ... }:

{
  services = {
    dunst = {
      enable = true;

      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };

      settings = with config.user-theme; {
        global = {
          monitor = 0;
          follow = "mouse";
          width = "(200, 400)";
          height = 300;
          origin = "top-right";
          offset = "6x36";
          scale = 0;
          progress_bar = true;
          progress_bar_height = 10;
          progress_bar_frame_width = 1;
          progress_bar_min_width = 1;
          progress_bar_max_width = 2;
          indicate_hidden = true;
          shrink = false;
          transparency = 15;
          separator_height = 5;
          padding = 8;
          horizontal_padding = 10;
          text_icon_padding = 0;
          frame_width = 2;
          frame_color = bg;
          separator_color = "frame";
          sort = true;
          idle_threshold = 120;
          font = "NotoSans Nerd Font Regular 12";
          line_height = 0;
          markup = "full";
          format = "<b>%s - %a</b>\\n%b";
          alignment = "left";
          show_age_threshold = 60;
          word_wrap = true;
          ellipsize = "middle";
          ignore_newline = false;
          stack_duplicates = true;
          hide_duplicate_count = false;
          show_indicators = true;
          icon_position = "left";
          max_icon_size = 64;
          sticky_history = true;
          history_length = 200;
          dmenu =
            "${pkgs.rofi} -dmenu -modi drun -p 'Dunst Actions:' -theme dracula";
          browser = "${pkgs.xdg-utils}/bin/xdg-open";
          always_run_script = true;
          title = "Dunst";
          class = "Dunst";
          corner_radius = 4;
          force_xinerama = false;
          mouse_left_click = "do_action,close_current";
          mouse_middle_click = "close_all";
          mouse_right_click = "close_current";
        };
        experimental = { per_monitor_dpi = false; };
        urgency_low = {
          background = bg;
          foreground = fg-alt;
          frame_color = fg-alt;
          timeout = 5;
          icon =
            "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark/symbolic/status/dialog-information-symbolic.svg";
        };
        urgency_normal = {
          background = bg;
          foreground = purple;
          frame_color = purple;
          timeout = 5;
          icon =
            "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark/symbolic/status/dialog-question-symbolic.svg";
        };
        urgency_critical = {
          background = red;
          foreground = fg;
          frame_color = red;
          timeout = 5;
          icon =
            "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark/symbolic/status/dialog-error-symbolic.svg";
        };
      };
    };
  };
}

