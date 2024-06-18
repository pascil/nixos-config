{pkgs, config, lib, outputs, ...}: with lib; {
  options = {
    modules.user.packages.coding.enable = mkEnableOption "Enable user coding packages";
  };

  config = lib.mkIf config.modules.user.packages.coding.enable {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfreePredicate = pkg:
      lib.elem (lib.getName pkg) [

      ];
    home.packages = with pkgs; [
        vscode-with-extensions
        neovim
    ];
  };
}
