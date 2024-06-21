{lib, config, pkgs, ...}: with lib; {
    options = {
        modules.system.general.enable = mkEnableOption "Enable general defaults";
    };

    config = mkIf config.modules.system.general.enable {
        nix.settings.experimental-features = ["nix-command" "flakes"];

        boot = {
            loader = {
                systemd-boot.enable = true;
                efi.canTouchEfiVariables = true;
            };
        };

        time.timeZone = "Europe/Berlin";
        i18n.defaultLocale = "de_DE.UTF-8";
        i18n.extraLocaleSettings = {
            LC_ADDRESS = "de_DE.UTF-8";
            LC_IDENTIFICATION = "de_DE.UTF-8";
            LC_MEASUREMENT = "de_DE.UTF-8";
            LC_MONETARY = "de_DE.UTF-8";
            LC_NAME = "de_DE.UTF-8";
            LC_NUMERIC = "de_DE.UTF-8";
            LC_PAPER = "de_DE.UTF-8";
            LC_TELEPHONE = "de_DE.UTF-8";
            LC_TIME = "de_DE.UTF-8";
        };

        hardware = {
            opengl.enable = true;
        };

        environment.sessionVariables = {
            XCURSOR_SIZE = 16;
            TERM = "konsole";
        };
    };
}
