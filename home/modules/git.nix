{ pkgs, ... }: 

{
  
  programs.git = {
    enable = true;
    userName = "Pascal Leinert";
    userEmail = "codeberg@pascal-leinert.de";
  };

}
