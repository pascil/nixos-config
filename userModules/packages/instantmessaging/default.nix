{pkgs, config, lib, outputs, ...}: with lib; {
  options = {
    modules.user.packages.instantmessaging.enable = mkEnbaleOption "Enable user instant messaging packages";
  };

  config = lib.mkIf config.modules.user.packages.instantmessaging.enable {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfreePredicate = pkg:
      lib.elem (lib.getName pkg) [

      ];
    home.packages = with pkgs; [
        vesktop
        element-desktop
        signal-desktop
        simplex-chat-desktop
    ];
  };
}