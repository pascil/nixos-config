{pkgs, config, lib, outputs, ...}: with lib; {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfreePredicate = pkg:
      lib.elem (lib.getName pkg) [
	      "vscode-with-extensions"
      ];
    home.packages = with pkgs; [
        neovim
        vscode-with-extensions
    ];
}
