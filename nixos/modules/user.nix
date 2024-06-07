{pkgs, ...}: {
  users.users.pl = {
    isNormalUser = true;
    description = "Pascal Leinert";
    extraGroups = ["networkmanager" "wheel" "audio" "video"];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };
}
