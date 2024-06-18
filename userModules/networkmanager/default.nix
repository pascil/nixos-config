{pkgs, config, lib, outputs, ...}: with lib; {
  options = {
    modules.user.packages.networkmanager.enable = mkEnableOption "Enable user networkmanager packages";
  };

  config = lib.mkIf config.modules.user.packages.networkmanager.enable {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfreePredicate = pkg:
      lib.elem (lib.getName pkg) [

      ];
    home.packages = with pkgs; [
        networkmanagerapplet
        networkmanager-openvpn
        networkmanager-vpnc
        kdePackages.networkmanager-qt
    ];
  };
}
