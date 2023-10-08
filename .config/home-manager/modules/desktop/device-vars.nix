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
    monitor = "DisplayPort-0";

    # netowrk options
    networkType = "wired";
    networkInterface = "enp39s0";

    # bar options
    barRightModules = [
      "updates-ipc-interval"
      "updates-ipc"
      "margin"
      "weather"
      "margin"
      "backlight"
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
      "battery"
      "margin"
      "date"
      "margin"
      "dnd"
    ];
    hwmonPath = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon2/temp3_input";
  };
}
