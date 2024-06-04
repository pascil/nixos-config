{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/dev/dev.nix
    ./modules/shells/shell.nix
    ./modules/desktop/desktop.nix
    ./modules/flatpak.nix
  ];
}
