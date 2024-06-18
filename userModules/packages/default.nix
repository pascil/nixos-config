{pkgs, config, lib, outputs, ...}: with lib; {
  options = {
    modules.user.packages.enable = mkEnableOption "Enable user packages";
  };

  config = lib.mkIf config.modules.user.packages.enable {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
        nextcloud-client
    ];
  };
}
