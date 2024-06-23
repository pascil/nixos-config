{ config, lib, ... }:

{
  boot = {
    kernelModules = [ "tp_smapi" ];
    extraModulePackages = with config.boot.kernelPackages; [ tp_smapi ];
  };

  hardware.trackpoint.enable = lib.mkDefault true;
  hardware.trackpoint.emulateWheel = lib.mkDefault config.hardware.trackpoint.enable;

  services.fprintd.enable = true;
}