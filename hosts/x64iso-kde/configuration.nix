{
  inputs,
  outputs,
  modulesPath,
  ...
}: let
    systemModules = "../../systemModules";
    userModules = "../../userModules";
   in {
    imports = [
      "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
      ../../systemModules/general
      ../../systemModules/desktop/kde
      ../../systemModules/desktop/wayland
      ../../systemModules/desktop/xorg
      ../../systemModules/packages
      ../../systemModules/packages/ruby
      ../../systemModules/programs/adb
      ../../systemModules/services
      ../../systemModules/services/tailscale
      ../../systemModules/system/bluetooth
      ../../systemModules/system/fstrim
      ../../systemModules/system/intel
      ../../systemModules/system/network
      ../../systemModules/system/powerManagement
      ../../systemModules/system/zram
    ];

    networking.hostName= "PLOS";
    system.stateVersion = "24.05";
  }
