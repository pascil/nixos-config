{config, lib, pkgs, ...}: with lib; {
    options = {
        modules.system.users.enable = mkEnableOption "Enable default user configuration";
    };

    config = mkIf config.modules.system.users.enable {
        programs.fish.enable = true;
        users = {
            users.pl = {
                isNormalUser = true;
                uid = 1000;
                home = "/home/pl";
                createHome = true;
                extraGroups = ["wheel" "networkmanager" "docker" "audio" "video" "adbusers"];
                shell = pkgs.fish;
            };
        };
    };
}
