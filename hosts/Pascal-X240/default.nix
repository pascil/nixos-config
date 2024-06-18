{
  inputs,
  outputs,
  ...
}: let
  utils = import ../../nix/utils.nix {inherit inputs outputs;};
  systemModules = [
    "general"
    "adb"
    "bluetooth"
    "fstrim"
    "intel"
    "network"
    "powerManagement"
    "zram"
    "wayland"
    "xorg"
    "kde"
    "packages"
    "services"
    "tailscale"
    "users"
  ];
  userModules = [
    "programs"
    "git"
    "hyfetch"
    "fish"
    "packages"
    "coding"
    #"flatpak"
    "instantmessaging"
    "libreoffice"
    "multimedia"
    "networkmanager"
    "webbrowsers"
  ];
in
  utils.addSystemModules systemModules {
    imports = [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      inputs.nix-flatpak.nixosModules.nix-flatpak
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
    system.stateVersion = "24.05";
  }
