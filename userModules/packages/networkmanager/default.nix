{pkgs, config, lib, outputs, ...}: with lib; {
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
}
