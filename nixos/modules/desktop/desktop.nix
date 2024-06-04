{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./plasma6.nix
    ./hyprland.nix
  ];
}
