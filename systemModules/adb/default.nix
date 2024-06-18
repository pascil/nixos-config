{lib, config, pkgs, ... }: with lib; {
    options = {
        modules.system.hardware.adb.enable = lib.mkEnableOption "Enable ADB configuration";
    };

    config = lib.mkIf config.modules.system.hardware.adb.enable {
        programs.adb.enable = true;
        services.udev.packages = [
            pkgs.android-udev-rules
        ];
    };
}
