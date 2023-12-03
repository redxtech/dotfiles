{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;

    package = pkgs.firefox-devedition-bin;

    profiles = {
      gabe = {

        settings = { "general.smoothScroll" = true; };

        extraConfig = builtins.readFile ./user.js;

        userChrome = builtins.readFile ./userChrome.css;
        userContent = builtins.readFile ./userContent.css;

        extensions = with pkgs.nur.repos.rycee.firefox-addons;
          [
            # bitwarden
            # darkreader
            enhancer-for-youtube
            # gesturefy
            # kagi-search
            # localcdn
            # raindropio
            # sidebery
            # sponsorblock
            # stylus
            # ublock-origin
          ];

        search = {
          force = true;
          default = "Kagi";
          order = [
            "Kagi"
            "DuckDuckGo"
            "Google"
            "NixOS Wiki"
            "Nix Packages"
            "Nix Options"
            "Home Manager"
            "Arch Wiki"
            "Arch Packages"
            "AUR"
          ];
          engines = let updateInterval = 24 * 60 * 60 * 1000; # every day
          in {
            "Kagi" = {
              urls = [
                { template = "https://kagi.com/search?q={searchTerms}"; }
                {
                  template = "https://kagi.com/api/autosuggest?q={searchTerms}";
                  type = "application/x-suggestions+json";
                }
              ];
              iconUpdateURL = "https://assets.kagi.com/v2/favicon-32x32.png";
              updateInterval = updateInterval;
              definedAliases = [ "@kagi" "@k" ];
            };
            "NixOS Wiki" = {
              urls = [{
                template = "https://nixos.wiki/index.php?search={searchTerms}";
              }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = updateInterval;
              definedAliases = [ "nw" ];
            };
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }];
              icon =
                "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "np" ];
            };
            "Nix Options" = {
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }];
              icon =
                "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "no" ];
            };
            "Home Manager" = {
              urls = [{
                template =
                  "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";
              }];
              iconUpdateURL =
                "https://mipmip.github.io/home-manager-option-search/images/favicon.png";
              updateInterval = updateInterval;
              definedAliases = [ "hm" ];
            };
            "Arch Wiki" = {
              urls = [{
                template =
                  "https://wiki.archlinux.org/index.php?search={searchTerms}";
              }];
              iconUpdateURL = "https://wiki.archlinux.org/favicon.ico";
              updateInterval = updateInterval;
              definedAliases = [ "aw" ];
            };
            "Arch Packages" = {
              urls = [{
                template = "https://nixos.wiki/index.php?search={searchTerms}";
              }];
              iconUpdateURL = "https://archlinux.org/static/favicon.ico";
              updateInterval = updateInterval;
              definedAliases = [ "ap" ];
            };
            "AUR" = {
              urls = [{
                template =
                  "https://aur.archlinux.org/packages?O=0&K={searchTerms}";
              }];
              iconUpdateURL =
                "https://aur.archlinux.org/static/images/favicon.ico";
              updateInterval = updateInterval;
              definedAliases = [ "aur" ];
            };
            "NPM" = {
              urls =
                [{ template = "https://www.npmjs.com/package/{searchTerms}"; }];
              iconUpdateURL =
                "https://static-production.npmjs.com/b0f1a8318363185cc2ea6a40ac23eeb2.png";
              updateInterval = updateInterval;
              definedAliases = [ "@npm" ];
            };
            "YouTube" = {
              urls = [{
                template =
                  "https://www.youtube.com/results?search_query={searchTerms}";
              }];
              iconUpdateURL =
                "https://www.youtube.com/s/desktop/85bdacdc/img/favicon_32x32.png";
              updateInterval = updateInterval;
              definedAliases = [ "yt" ];
            };
            "Amazon CA" = {
              urls =
                [{ template = "https://www.amazon.ca/s?k={searchTerms}"; }];
              iconUpdateURL = "https://www.amazon.ca/favicon.ico";
              updateInterval = updateInterval;
              definedAliases = [ "@a" ];
            };
            "Bing".metaData.alias = "@b";
            "Google".metaData.alias = "@g";
            # "Amazon".metaData.alias = "@a";
          };
        };
      };
      other = {
        id = 1;
        name = "other";
      };
    };
  };
}
