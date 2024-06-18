{pkgs, config, lib, outputs, ...}: with lib; {
  options = {
    modules.user.packages.multimedia.enable = mkEnableOption "Enable user multimedia packages";
  };

  config = lib.mkIf config.modules.user.packages.multimedia.enable {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfreePredicate = pkg:
      lib.elem (lib.getName pkg) [

      ];
    home.packages = with pkgs; [
        mpv
        vlc
    ];
  };
}
