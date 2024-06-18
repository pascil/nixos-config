{config, lib, ...}: with lib;{
    options = {
        modules.system.tailscale.enable = lib.mkEnableOption "Enable tailscale service";
    };

    config = lib.mkIf config.modules.system.tailscale.enable {
        services.tailscale = {
            enable = true;
            useRoutingFeatures = "both";
        };
    };
}
