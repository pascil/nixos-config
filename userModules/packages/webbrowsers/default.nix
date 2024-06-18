{pkgs, config, lib, outputs, ...}: with lib; {
  options = {
    modules.user.packages.webbrowsers.enable = mkEnbaleOption "Enable user web browser packages";
  };

  config = lib.mkIf config.modules.user.packages.webbrowsers.enable {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfreePredicate = pkg:
      lib.elem (lib.getName pkg) [

      ];
    home.packages = with pkgs; [
        ungoogled-chromium
        firefox
        tor-browser
    ];
  };
}
