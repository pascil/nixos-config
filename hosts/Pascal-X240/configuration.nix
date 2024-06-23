{
  inputs,
  outputs,
  ...
}: let
    systemModules = "../../systemModules";
    userModules = "../../userModules";
   in {
    imports = [
      ./hardware-configuration.nix
      ./users.nix
      ../../systemModules/general
      ../../systemModules/desktop/kde
      ../../systemModules/desktop/wayland
      ../../systemModules/desktop/xorg
      ../../systemModules/hardware/lenovo
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

    networking.hostName= "Pascal-X240";
    system.stateVersion = "24.05";
  }
