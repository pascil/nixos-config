{lib, config, pkgs, ... }: with lib; {
    options = {
        modules.system.template.enable = lib.mkEnableOption "Template configuration";
    };

    config = lib.mkIf config.modules.system.template.enable {
        
    };
}