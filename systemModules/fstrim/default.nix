{lib, config, pkgs, ... }: with lib; {
    options = {
        modules.system.hardware.fstrim.enable = lib.mkEnableOption "Enable trim configuration";
    };

    config = lib.mkIf config.modules.system.hardware.fstrim.enable {
      services.fstrim.enable = true;
    };
}
