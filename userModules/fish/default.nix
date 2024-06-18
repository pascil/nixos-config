{lib, config, pkgs, ... }: with lib; {
    options = {
        modules.user.fish.enable = lib.mkEnableOption "User Fish configuration";
    };

    config = lib.mkIf config.modules.user.fish.enable {
        programs.fish = {
            enable = true;
            shellAliases = {
                clear = "clear && hyfetch";
                ll = "ls -l";
                fs = "flatpak search --columns=name,application";
                update-system = " nix flake update && ~/.nixconf/rebuild.sh";
                collect-garbage = "sudo nix-collect-garbage --delete-old";
            };
        };
    };
}