{config, lib, ...}: with lib; {
    options = {
        modules.system.powerManagement.enable = mkEnableOption "Enable default Power Management configuration";
    };
    config = lib.mkIf config.modules.system.powerManagement.enable {
        powerManagement.enable = true;
        services.power-profiles-daemon.enable = false;
        services.thermald.enable = true;
        services.auto-cpufreq.enable = true;
        services.auto-cpufreq.settings = {
            battery = {
                governor = "powersave";
                turbo = "never";
            };
            charger = {
                governor = "performance";
                turbo = "auto";
            };
        };
    };
}
