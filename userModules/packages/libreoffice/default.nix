{pkgs, config, lib, outputs, ...}: with lib; {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfreePredicate = pkg:
      lib.elem (lib.getName pkg) [

      ];
    home.packages = with pkgs; [
        pkgs.libreoffice-qt6-fresh
        pkgs.hunspell
        pkgs.hunspellDicts.de_DE
        pkgs.hunspellDicts.en_GB-ise
    ];
}
