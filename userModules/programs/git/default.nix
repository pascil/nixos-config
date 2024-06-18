{lib, config, pkgs, ... }: with lib; {
    options = {
        modules.user.programs.git.enable = lib.mkEnableOption "User Git configuration";
    };

    config = lib.mkIf config.modules.user.programs.git.enable {
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