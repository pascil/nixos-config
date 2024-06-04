{ config, pkgs, ... }:

{

  imports = [
    ./modules/user.nix
    ./modules/packages.nix
    ./modules/services.nix
    ./modules/system/system.nix
    ./modules/desktop/desktop.nix
  ];

}
