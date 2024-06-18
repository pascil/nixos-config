{config, libs, ...}: {
    options = {
        modules.system.services.docker.enable = lib.mkEnableOption "Enable docker service";
    };

    config = lib.mkIf config.modules.system.services.docker.enable {
        virtualisation.docker = {
            enable = true;
            enableOnBoot = true;
            storageDriver = "btrfs";
            autoPrune.dates = "weekly";
            daemon.settings = {ipv6 = true;};
        };
    };
}