{pkgs, config, lib, ...}: with lib; {
    # Allow certain unfree user-level packages
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
	pkgs.itch
        pkgs.prismlauncher
        pkgs.jdk22
        pkgs.xonotic
	pkgs.veloren
	pkgs.mindustry
	pkgs.endless-sky
	pkgs.0ad
	pkgs.cataclysm-dda	
    ];
}
