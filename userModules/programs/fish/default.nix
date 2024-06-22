{lib, config, pkgs, ... }: with lib; {
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
}