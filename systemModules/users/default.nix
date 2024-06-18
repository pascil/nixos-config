{config, lib, pkgs, ...}: with libs; {
    options = {
        modules.system.users.enable = mkEnableOption "Enable default user configuration";
    };

    config = mkIf config.modules.system.users.enable = {
        programs.fish.enable = true;
        users = {
            mutableUsers = false;
            users.root = {
                home = "/root";
                initialPassword = "password123";
            };
            users.pl = {
                isNormalUser = true;
                uid = 1000;
                home = "/home/pl";
                createHome = true;
                extraGroups = ["wheel" "networkmanager" "docker" "audio" "video" "adbusers"];
                initialPassword = "password123";
                shell = pkgs.fish;
            };
        };
    };
}