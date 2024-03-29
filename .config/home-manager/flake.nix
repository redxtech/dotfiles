{
  description = "Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    homeage = {
      url = "github:jordanisaacs/homeage";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        localSystem = system;
        overlays = [
          inputs.neovim-nightly-overlay.overlay
          inputs.nur.overlay
          (import ./modules/package-overlays.nix)
          (import ./pkgs)
        ];
      };
    in {
      homeConfigurations = {
        "gabe@bastion" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            localSystem = system;
            overlays = pkgs.overlays ++ [ ];
          };

          modules = [
            {
              home = {
                homeDirectory = "/home/gabe";
                username = "gabe";
                stateVersion = "23.05";
              };
            }
            ./modules/common.nix
            ./modules/desktop
            inputs.homeage.homeManagerModules.homeage
          ];
        };
        "gabe@laptop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            {
              home = {
                homeDirectory = "/home/gabe";
                username = "gabe";
                stateVersion = "23.05";
              };
            }
            ./modules/common.nix
            ./modules/laptop
            inputs.homeage.homeManagerModules.homeage
          ];
        };
      };
    };
}
