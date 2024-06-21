{config, lib	, ...}: {
    virtualisation.docker = {
        enable = true;
        enableOnBoot = true;
        storageDriver = "btrfs";
        autoPrune.dates = "weekly";
        liveRestore = false;
    };
}
