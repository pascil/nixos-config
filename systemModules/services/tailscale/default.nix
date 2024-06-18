{config, lib, ...}: with lib;{
    options = {
        modules.system.services.tailscale.enable = lib.mkEnableOption "Enable tailscale service";
    };

    config = lib.mkIf config.modules.system.services.tailscale.enable {
        services.tailscale = {
            enable = true;
            useRoutingFeatures = "both";
        };
    };
}
