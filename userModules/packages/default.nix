{pkgs, config, lib, ...}: with lib; {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
        pkgs.nextcloud-client
        pkgs.htop
    ];
}
