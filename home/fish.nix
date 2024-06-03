{pkgs, ...}:

{
 
  programs.fish = {
    enable = true;
    shellAliases = {
      clear = "clear && hyfetch";
      ll = "ls -l";
    };
  };

}
