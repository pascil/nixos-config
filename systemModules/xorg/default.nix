{lib, config, pkgs, ... }: {
    options = {
        modules.system.xorg.enable = lib.mkEnableOption "Enable xorg settings";
    };

    config = lib.mkIf config.modules.system.xorg.enable {
        services.xserver = {
            enable = true;
            xkb.layout = "de";
            xkb.variant = "nodeadkeys";
        };
    };
}
