{ config, pkgs, ... }:

{
  programs = {
    bat = {
      enable = true;
      config = { theme = "Dracula"; };
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "dracula";
        theme_background = false;
        presets =
          "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
        vim_keys = true;
        graph_symbol = "braille";
        shown_boxes = "cpu net proc mem";
        update_ms = 1500;
        proc_sorting = "cpu direct";
        proc_filter_kernel = true;
        disks_filter = "exclude=/boot";
        show_swap = false;
        swap_disk = false;
      };
    };

    # carapace.enable = true;

    cava = {
      enable = true;
      settings = {
        general = {
          autosens = 1;
          bar_width = 3;
          framerate = 144;
          # overshoot = 20;
          # sensitivity = 100;
        };
        input = { source = "auto"; };
        color = { foreground = "blue"; };
        smoothing = {
          monstercat = 1; # TODO: test this
        };
      };
    };

    direnv = {
      enable = true;

      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    eza = {
      enable = true;
      git = true;
      icons = true;
      extraOptions = [ "--group-directories-first" "--header" ];
    };

    fzf = {
      enable = true;

      colors = with config.user-theme; {
        bg = bg;
        "bg+" = bg-alt;
        fg = fg;
        "fg+" = fg;
        hl = purple;
        "hl+" = purple;
        info = orange;
        prompt = green;
        pointer = pink;
        marker = pink;
        spinner = orange;
        header = fg-alt;
      };

      tmux.enableShellIntegration = true;
    };

    gpg = { enable = false; };
    granted = { enable = false; };

    htop.enable = true;
    jq.enable = true;

    keychain = { enable = false; };

    pyenv.enable = true;

    ripgrep.enable = true;

    ruff.enable = false;

    ssh = let
      user = "gabe";
      identityFile = "~/.ssh/id_ed25519";
    in {
      enable = true;

      matchBlocks = {
        "desktop" = {
          user = user;
          identityFile = identityFile;
          hostname = "10.0.0.59";
        };
        "desktop-remote" = {
          user = user;
          identityFile = identityFile;
          hostname = "desktop.gabedunn.dev";
        };
        "laptop" = {
          user = user;
          identityFile = identityFile;
          hostname = "10.0.0.161";
          port = 5022;
        };
        "rock-hard" = {
          user = user;
          identityFile = identityFile;
          hostname = "10.0.0.191";
        };
        "sb" = {
          user = "redxtech";
          identityFile = identityFile;
          hostname = "titan.usbx.me";
        };
        "aur" = {
          user = "aur";
          identityFile = "~/.ssh/aur";
          hostname = "titan.usbx.me";
        };
      };
    };

    tealdeer = {
      enable = true;

      settings = {
        display = { compact = false; };
        updates = {
          auto_update = true;
          auto_update_interval_hours = 168;
        };
      };
    };

    tmux = {
      enable = true;

      prefix = "C-a";
      baseIndex = 1;
      terminal = "tmux-256color";
      clock24 = true;
      mouse = true;

      plugins = with pkgs.tmuxPlugins; [
        sensible
        sessionist
        vim-tmux-navigator
        {
          plugin = dracula;
          extraConfig = ''
            set -g @dracula-refresh-rate 5
            set -g @dracula-show-flags true
            set -g @dracula-show-powerline true
            set -g @dracula-show-battery false
            set -g @dracula-show-left-icon session
            set -g @dracula-border-contrast true
            set -g @dracula-show-empty-plugins false

            set -g @dracula-military-time true
            set -g @dracula-show-timezone false

            set -g @dracula-show-fahrenheit false
            set -g @dracula-cpu-display-load false

            set -g @dracula-ram-usage-colors "green dark_gray"
            set -g @dracula-cpu-usage-colors "pink dark_gray"

            set -g @dracula-plugins "cpu-usage ram-usage time"
          '';
        }
        {
          plugin = resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        {
          plugin = continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60' # minutes
          '';
        }
      ];

      extraConfig = ''
        # set window split keybind
        bind - split-window -v -c '#{pane_current_path}'
        bind \\ split-window -h -c '#{pane_current_path}'

        # bind resizing panes
        bind -r C-Up resize-pane -U 2
        bind -r C-Down resize-pane -D 2
        bind -r C-Right resize-pane -R 2
        bind -r C-Left resize-pane -L 2

        bind -n S-Up resize-pane -U 5
        bind -n S-Down resize-pane -D 5
        bind -n S-Right resize-pane -R 10
        bind -n S-Left resize-pane -L 10

        # window binds
        bind c new-window
        bind b break-pane -d


        # sessions binds
        bind C-j split-window -v "tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^\"(tmux display-message -p '#S')\"\" | fzf --reverse | xargs tmux switch-client -t"

        # bind re-sourcing
        bind r source-file $HOME/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded"

        # quick keybinds
        bind h split-window -h "htop"
        bind t split-window -h "vim ~/.tmux.conf"
        bind v split-window -h "vim ~/.config/nvim/init.vim"

        # prompted join-pane
        bind j command-prompt -p "join pane from: "  "join-pane -h -s '%%'"

        # easily swap a pane (targeted by pane number) with the current pane
        bind s display-panes\; command-prompt -p "pane #: "  "swap-pane -t '%%'"

        bind C-b send-keys 'tat && exit' 'C-m'
        bind K run-shell 'tmux switch-client -n \; kill-session -t "$(tmux display-message -p "#S")" || tmux kill-session'

        # some options
        set -ga terminal-overrides ",xterm-kitty:RGB"
        set -g renumber-windows on
        set -g mode-style "fg=black,bg=brightgreen"
        set -g set-titles on
        set -g set-titles-string "#T"
        set -g display-time 2500
        set -g status-interval 3

        set -g pane-active-border-style bg=default,fg=red
        set -g pane-border-style fg=white

      '';
    };

    yt-dlp = {
      enable = true;

      settings = {
        output = "'%(creator)s - %(title)s.%(ext)s'";
        # format = "best";
        concurrent-fragments = 5;
        write-thumbnail = true;
        audio-multistreams = true;
        prefer-free-formats = true;
        write-subs = true;
        remux-video = "mkv";
        embed-subs = true;
        embed-thumbnail = true;
        embed-metadata = true;
        embed-chapters = true;
        embed-info-json = true;
        sponsorblock-mark = "all";
      };
    };
  };
}

