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
      ../../systemModules/packes
      ../../systemModules/services

    ];

    home-manager = {
      programs.home-manager.enable = true;
      home = {
        username = "pl";
        homeDirectory = "/home/pl";
        sessionVariables = {
          EDITOR = "nano";
        };
        stateVersion = "24.05";
      imports = [
        ../../userModules/git
        ../../userModules/hyfetch
        ../../userModules/fish
      ];
      };
    };

    networking.hostName= "Pascal-Server";
    system.stateVersion = "24.05";
  }
