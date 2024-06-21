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
      ../../systemModules/bluetooth
      ../../systemModules/general
      ../../systemModules/fstrim
      ../../systemModules/intel
      ../../systemModules/kde
      ../../systemModules/ruby
      ../../systemModules/network
      ../../systemModules/powerManagement
      ../../systemModules/samba
      ../../systemModules/wayland
      ../../systemModules/xorg
      ../../systemModules/zram
      ../../systemModules/packages
      ../../systemModules/services
      ../../systemModules/tailscale
    ];

    networking.hostName= "Pascal-X240";
    system.stateVersion = "24.05";
  }
