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
      ../../systemModules/docker/default.nix
      ../../systemModules/general/default.nix
      ../../systemModules/fstrim/default.nix
      ../../systemModules/intel/default.nix
      ../../systemModules/ruby/default.nix
      ../../systemModules/network/default.nix
      ../../systemModules/samba/default.nix
      ../../systemModules/zram/default.nix
      ../../systemModules/packages/default.nix
      ../../systemModules/services/default.nix

    ];

    networking.hostName= "Pascal-Server";
    system.stateVersion = "24.05";
  }
