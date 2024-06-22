{lib, config, pkgs, ... }: with lib; {
    zramSwap = {
      enable = true;
      algorithm = "lz4";
      memoryPercent = 100;
      priority = 999;
    };
}
