{lib, config, pkgs, ... }: with lib; {
    options = {
        modules.user.programs.enable = lib.mkEnableOption "User Programs configuration";
    };

    config = lib.mkIf config.modules.user.programs.enable {

    };
}
