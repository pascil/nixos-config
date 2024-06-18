{lib, config, pkgs, ... }: with lib; {
    options = {
        modules.user.template.enable = lib.mkEnableOption "Template configuration";
    };

    config = lib.mkIf config.modules.user.template.enable {
        
    };
}