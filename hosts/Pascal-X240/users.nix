{config, pkgs, ...}: {
        users = {
            users.pl = {
  		description = "Pascal Leinert";
                isNormalUser = true;
                uid = 1000;
                home = "/home/pl";
                createHome = true;
                extraGroups = ["wheel" "networkmanager" "audio" "video" "adbusers"];
                shell = pkgs.fish;
            };
        };
}
