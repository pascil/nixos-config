{pkgs, config, lib, outputs, ...}: with lib; {
  options = {
    modules.user.packages.libreoffice.enable = mkEnableOption "Enable user libreoffice packages";
  };

  config = lib.mkIf config.modules.user.packages.libreoffice.enable {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfreePredicate = pkg:
      lib.elem (lib.getName pkg) [

      ];
    home.packages = with pkgs; [
        libreoffice-qt6-fresh
    ];
  };
}
