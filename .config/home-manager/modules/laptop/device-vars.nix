# place to set per-device variables to keep the configuration DRY
{ lib, config, pkgs, ... }:

let
  deviceVar = lib.mkOptionType {
    name = "device-variable";
    description = "variable that represents a per-device variable";
  };

  mkDeviceVarOption = name: default: (lib.mkOption {
    type = deviceVar;
    description = "The device-specific variable for '${name}'.";
    inherit default;
  });
in
{
  options.device-vars = builtins.mapAttrs mkDeviceVarOption rec {
    # primary monitor
    monitor = "eDP-1";

    # netowrk options
    networkType = "wireless";
    networkInterface = "lo";
  };
}
