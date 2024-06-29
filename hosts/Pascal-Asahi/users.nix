{config, pkgs, ...}: {
        sops.secrets.pl-password.neededForUsers = true;
        users.mutableUsers = false;
        users = {
            users.pl = {
                description = "Pascal Leinert";
                isNormalUser = true;
                hashedPasswordFile = config.sops.secrets.pl-password.path;
                uid = 1000;
                home = "/home/pl";
                createHome = true;
                extraGroups = ["wheel" "networkmanager" "audio" "video"];
                shell = pkgs.fish;
                openssh.authorizedKeys.keys = [
		           (builtins.readFile ./keys/id_ed25519.pub)
		        ];
            };
        };
        programs.fish.enable = true;
}
