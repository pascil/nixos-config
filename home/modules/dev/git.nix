{ pkgs, ... }: 

{
  
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

}
