{ config, pkgs, ... }:

{

  imports = [
    ./modules/dev/dev.nix
    ./modules/shells/shell.nix
  ];

}
