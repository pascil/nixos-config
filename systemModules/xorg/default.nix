{lib, config, pkgs, ... }: {
    services.xserver = {
        enable = true;
        xkb.layout = "de";
        xkb.variant = "nodeadkeys";
    };

}
