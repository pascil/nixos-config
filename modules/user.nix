{ pkgs, ... }: {

users.users.pl = {
    isNormalUser = true;
    description = "Pascal Leinert";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };

}
