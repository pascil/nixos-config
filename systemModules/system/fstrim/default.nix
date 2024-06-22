{lib, config, pkgs, ... }: with lib; {
  services.fstrim.enable = true;
}
