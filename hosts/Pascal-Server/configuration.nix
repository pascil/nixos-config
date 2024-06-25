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
      ../../systemModules/packages
      ../../systemModules/packages/ruby
      ../../systemModules/system/fstrim
      ../../systemModules/system/intel
      ../../systemModules/system/network
      ../../systemModules/system/network/proxmox-vlan
      ../../systemModules/system/zram
      ../../systemModules/services
      ../../systemModules/services/samba
      ../../systemModules/virt/docker

    ];

    networking.hostName= "Pascal-Server";
    system.stateVersion = "24.05";
  }
