{ config, pkgs, ... }:

{

  imports = [
    ./modules/git.nix
    ./modules/shells/shell.nix
  ];

}
