# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  outputs,
  ...
}: let
  utils = import ../../nix/utils.nix {inherit inputs outputs;};
  systemModules = [
    "general"
    "hardware/adb"
    "hardware/bluetooth"
    "hardware/fstrim"
    "hardware/intel"
    "hardware/network"
    "hardware/powerManagement"
    "hardware/zram"
    "desktop/wayland"
    "desktop/xorg"
    "desktop/kde"
    "packages"
    "services"
    "services/tailscale"
    "users"
  ];
  userModules = [
    "programs"
    "programs/git"
    "programs/hyfetch"
    "programs/fish"
    "packages"
    "packages/coding"
    "packages/flatpak"
    "packages/instantmessaging"
    "packages/libreoffice"
    "packages/multimedia"
    "packages/networkmanager"
    "packages/webbrowsers"
  ];
in
  utils.addSystemModules systemModules {
    imports = [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs;};
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
