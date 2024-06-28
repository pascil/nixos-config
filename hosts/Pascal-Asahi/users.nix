{config, pkgs, ...}: {
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
        sops.secrets.pl-password.neededForUsers = true;
	    users.mutableUsers = false;
        programs.fish.enable = true;
}
