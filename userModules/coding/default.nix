{pkgs, config, lib, outputs, ...}: with lib; {
  options = {
    modules.user.coding.enable = mkEnableOption "Enable user coding packages";
  };

  config = lib.mkIf config.modules.user.coding.enable {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfreePredicate = pkg:
      lib.elem (lib.getName pkg) [
	"vscode-with-extensions"
      ];
    home.packages = with pkgs; [
        neovim
        vscode-with-extensions
    ];
  };
}
