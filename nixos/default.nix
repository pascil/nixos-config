{ config, pkgs, ... }:

{

  imports = [
    ./modules/user.nix
    ./modules/packages.nix
    ./modules/programs.nix
    ./modules/services.nix
    ./modules/system/system.nix
    ./modules/desktop/desktop.nix
  ];

}
