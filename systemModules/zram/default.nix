{lib, config, pkgs, ... }: with lib; {
    options = {
        modules.system.zram.enable = lib.mkEnableOption "Enable zram configuration";
    };

    config = lib.mkIf config.modules.system.zram.enable {
      zramSwap = {
        enable = true;
        algorithm = "lz4";
        memoryPercent = 100;
        priority = 999;
      };
    };
}
