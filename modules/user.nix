{ pkgs, ... }: {

users.users.pl = {
    isNormalUser = true;
    description = "Pascal Leinert";
    extraGroups = [ "networkmanager" "wheel" "davfs2" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };

}
