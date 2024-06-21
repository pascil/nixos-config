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
      ../../systemModules/docker
      ../../systemModules/general
      ../../systemModules/fstrim
      ../../systemModules/intel
      ../../systemModules/ruby
      ../../systemModules/network
      ../../systemModules/samba
      ../../systemModules/zram
      ../../systemModules/packages
      ../../systemModules/services

    ];
    
    networking.hostName= "Pascal-Server";
    system.stateVersion = "24.05";
  }
