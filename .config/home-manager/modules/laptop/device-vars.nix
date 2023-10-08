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

    # bar options
    barRightModules = [
      "updates-ipc-interval"
      "updates-ipc"
      "margin"
      "weather"
      "margin"
      # "kdeconnect"
      # "margin"
      "pipewire"
      "margin"
      "memory"
      "margin"
      "temperature"
      "margin"
      "cpu"
      "margin"
      "network"
      "margin"
      "date"
      "margin"
      "dnd"
    ];
    hwmonPath = "/sys/devices/platform/coretemp.0/hwmon/hwmon6/temp1_input";
  };
}
