{
  inputs,
  outputs,
  ...
}: let
  utils = import ../../nix/utils.nix {inherit inputs outputs;};
  systemModules = [
    "docker"
    "general"
    "fstrim"
    "intel"
    "ruby"
    "network"
    "samba"
    "zram"
    "packages"
    "services"
  ];
  userModules = [
    "git"
    "hyfetch"
    "fish"
  ];
in
  utils.addSystemModules systemModules {
    imports = [
      ./hardware-configuration.nix
      ./users.nix
      inputs.home-manager.nixosModules.default
    ];

    home-manager = {
      extraSpecialArgs = {inherit inputs;};
      users = {
        "pl" = utils.addUserModules userModules {
          home = rec {
            username = "pl";
            homeDirectory = "/home/${username}";
            stateVersion = "24.05";
          };
          programs.home-manager.enable = true;
        };
      };
    };
    networking.hostName= "Pascal-Server";
    system.stateVersion = "24.05";
  }
