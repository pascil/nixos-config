{config, ...}: {
        users = {
            users.pl = {
                isNormalUser = true;
                uid = 1000;
                home = "/home/pl";
                createHome = true;
                extraGroups = ["wheel" "networkmanager" "audio" "video" "adbusers"];
                shell = pkgs.fish;
            };
        };
}