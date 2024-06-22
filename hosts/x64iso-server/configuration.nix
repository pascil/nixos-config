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
      ../../systemModules/packages
      ../../systemModules/packages/ruby
      ../../systemModules/system/fstrim
      ../../systemModules/system/intel
      ../../systemModules/system/network
      ../../systemModules/system/zram
      ../../systemModules/services
      ../../systemModules/services/samba
      ../../systemModules/virt/docker

    ];

    nixpkgs.hostPlatform = "x86_64-linux";
    networking.hostName = "PLOS";
    system.stateVersion = "24.05";
  }
