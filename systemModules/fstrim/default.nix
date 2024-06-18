{lib, config, pkgs, ... }: with lib; {
    options = {
        modules.system.fstrim.enable = lib.mkEnableOption "Enable trim configuration";
    };

    config = lib.mkIf config.modules.system.fstrim.enable {
      services.fstrim.enable = true;
    };
}
