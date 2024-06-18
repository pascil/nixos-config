{config, lib, pkgs, ...}: with lib; {
    options = {
        modules.system.desktop.wayland.enable = lib.mkEnableOption = "Enable wayland configuation";
    };

    config = lib.mkIf config.modules.system.desktop.wayland.enable {
        xdg.portal = {
            enable = true;
            config = {
                common = {
                    default = [
                        kde
                    ];
                };
            };
        };
        extraPortal = [pkgs.xdg-desktop-portal-kde];
    };

    services.displayManager = {
        sddm.enable = true;
        sddm.wayland.enable true;
    };

    services.pipewire = {
        enable = true;
        wireplumber.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

    programs.dconf.enable = true;

    environment.sessionVariables = {
        QT_SCALE_FACTOR = 1;
        ELM_SCALE = 1;
        GDK_SCALE = 1;
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
    };
}