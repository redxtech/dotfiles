{ config, pkgs, lib, ... }:

{
  imports = [
    ./homeage.nix
    ./git.nix
    ./neovim.nix
    ./programs.nix
    ./services.nix
    ./user-theme.nix
    ./zsh.nix
  ];

  home = {
    language.base = "en_CA.UTF-8";

    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
      # "${config.xdg.configHome}/rofi/scripts"
    ];

    sessionVariables = {
      BROWSER = "vivaldi-stable";
      VISUAL = "nvim";
      TERMINAL = "kitty";
    };

    packages = with pkgs; [
      age
      atool
      bitwarden-cli
      bluetuith
      cachix
      cava
      delta
      dex
      du-dust
      dua
      fd
      fx
      glxinfo
      google-cloud-sdk
      gvfs
      hub
      kubecolor
      kubectl
      kubectx
      lsb-release
      mediainfo
      mozillavpn
      neofetch
      nixd
      nixfmt
      nix-du
      nodejs
      pamixer
      pipes-rs
      playerctl
      prettyping
      ps_mem
      rage
      ranger
      rclone
      rsync
      sd
      shell_gpt
      slurm
      spotify-tui
      sqlite
      switchup
      telepresence2
      tokei
      yadm
      yq-go
      xclip
      xdg-utils

      # python
      (python3.withPackages (ps: with ps; [ requests ]))

    ];
  };

  xdg = {
    enable = true;

    userDirs = { videos = "${config.home.homeDirectory}/Videos"; };
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://devenv.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
      allowUnfreePredicate = (pkg: true);
    };
  };

  manual = {
    html.enable = true;
    json.enable = lib.mkDefault true;
  };

  # set up later
  accounts = { };

  # let home manager install and manage itself.
  programs.home-manager.enable = true;
}

