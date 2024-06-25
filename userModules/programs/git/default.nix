{lib, config, pkgs, ... }: with lib; {
    programs.git = {
        enable = true;
        userName = "Pascal Leinert";
        userEmail = "git@pascal-leinert.de";
        lfs.enable = true;
        aliases = {
            ci = "commit -vam";
            s = "status";
        };
    };
}
