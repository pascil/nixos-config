{pkgs, config, lib, ...}: with lib; {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
        nextcloud-client
        htop
    ];
}
