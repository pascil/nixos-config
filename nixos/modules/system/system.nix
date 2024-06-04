{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bootloader.nix
    ./env.nix
    ./sound.nix
    ./intel.nix
    ./networking.nix
    ./trim.nix
    ./zram.nix
  ];
}
