{lib, config, pkgs, ... }: with lib; {
    programs.adb.enable = true;
    services.udev.packages = [
        pkgs.android-udev-rules
    ];
}
