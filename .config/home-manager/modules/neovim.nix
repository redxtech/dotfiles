{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;

    package = pkgs.neovim-nightly;

    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
    -- bootstrap lazy.nvim, lazyvim and my plugins
    require('config.lazy')
    '';

    extraPackages = with pkgs; [ gcc shellcheck ];

  };
}
