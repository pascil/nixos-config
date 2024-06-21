{config, lib, ...}: with lib;{
        services.tailscale = {
            enable = true;
            useRoutingFeatures = "both";
        };
}
