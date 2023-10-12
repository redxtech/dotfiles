{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;

    theme = "Dracula";

    font = {
      name = "DankMono-Regular";
      size = 12;
    };

    # keybindings = {};

    settings = {
      cursor_shape = "beam";

      scrollback_lines = 10000;
      scrollback_pager =
        "${config.xdg.configHome}/kitty/pager.sh 'INPUT_LINE_NUMBER' 'CURSOR_LINE' 'CURSOR_COLUMN'";
      scrollback_pager_history_size = 100;

      url_color = "#0087bd";
      url_style = "single";

      repaint_delay = 7;

      enable_audio_bell = false;

      remember_window_size = false;
      initial_window_width = "140c";
      initial_window_height = "40c";

      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_bar_min_tabs = 2;
      tab_activity_symbol = "*";
      tab_title_template = "{index}  {title}";

      active_tab_foreground = "${config.user-theme.fg}";
      active_tab_background = "${config.user-theme.bg}";
      active_tab_font_style = "bold-italic";
      inactive_tab_foreground = "${config.user-theme.fg}";
      inactive_tab_background = "${config.user-theme.bg}";
      inactive_tab_font_style = "normal";

      background_opacity = "0.9";

      editor = "nvim";

      wayland_titlebar_color = "background";
    };

    shellIntegration.enableZshIntegration = true;
  };

  xdg.configFile."kitty/pager.sh".text = ''
    #!${pkgs.bash}/bin/bash
    set -eu

    if [ "$#" -eq 3 ]; then
      INPUT_LINE_NUMBER=''${1:-0}
      CURSOR_LINE=''${2:-1}
      CURSOR_COLUMN=''${3:-1}
      AUTOCMD_TERMCLOSE_CMD="call cursor(max([0,''${INPUT_LINE_NUMBER}-1])+''${CURSOR_LINE}, ''${CURSOR_COLUMN})"
    else
      AUTOCMD_TERMCLOSE_CMD="normal G"
    fi

    exec nvim 63<&0 0</dev/null \
      -u NONE \
      -c "map <silent> q :qa!<CR>" \
      -c "set shell=bash scrollback=100000 termguicolors laststatus=0 clipboard+=unnamedplus" \
      -c "autocmd TermEnter * stopinsert" \
      -c "autocmd TermClose * ''${AUTOCMD_TERMCLOSE_CMD}" \
      -c 'terminal sed </dev/fd/63 -e "s/'$'\x1b''']8;;file:[^\]*[\]//g" && sleep 0.01 && printf "'$'\x1b''']2;"'
  '';
}

