{config, lib	, ...}: {
    options = {
        modules.system.docker.enable = lib.mkEnableOption "Enable docker service";
    };

    config = lib.mkIf config.modules.system.docker.enable {
        virtualisation.docker = {
            enable = true;
            enableOnBoot = true;
            storageDriver = "btrfs";
            autoPrune.dates = "weekly";
            liveRestore = false;
        };
    };
}
