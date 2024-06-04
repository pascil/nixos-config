{pkgs, ...}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      clear = "clear && hyfetch";
      ll = "ls -l";
      "flatpak search" = "flatpak search --columns=name,application";
    };
  };
}
