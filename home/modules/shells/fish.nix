{pkgs, ...}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      clear = "clear && hyfetch";
      ll = "ls -l";
      fs = "flatpak search --columns=name,application";
      update-system = " nix flake update && ~/.nixconf/rebuild.sh";
      collect-garbage = "sudo nix-collect-garbage --delete-old && home-manager expire-generations '-1 day'";
    };
  };
}
