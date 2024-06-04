{pkgs, ...}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      clear = "clear && hyfetch";
      ll = "ls -l";
      fs = "flatpak search --columns=name,application";
    };
  };
}
