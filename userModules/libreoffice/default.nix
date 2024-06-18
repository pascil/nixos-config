{pkgs, config, lib, outputs, ...}: with lib; {
  options = {
    modules.user.libreoffice.enable = mkEnableOption "Enable user libreoffice packages";
  };

  config = lib.mkIf config.modules.user.libreoffice.enable {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfreePredicate = pkg:
      lib.elem (lib.getName pkg) [

      ];
    home.packages = with pkgs; [
        libreoffice-qt6-fresh
    ];
  };
}
