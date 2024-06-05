{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/dev/dev.nix
    ./modules/shells/shell.nix
    ./modules/desktop/desktop.nix
    ./programs/programs.nix
    ./modules/flatpak.nix
  ];
}
