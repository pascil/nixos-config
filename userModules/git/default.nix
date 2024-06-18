{lib, config, pkgs, ... }: with lib; {
    options = {
        modules.user.git.enable = lib.mkEnableOption "User Git configuration";
    };

    config = lib.mkIf config.modules.user.git.enable {
        programs.git = {
            enable = true;
            userName = "Pascal Leinert";
            userEmail = "codeberg@pascal-leinert.de";
            lfs.enable = true;
            aliases = {
                ci = "commit -vam";
                s = "status";
            };
        };
    };
}