{config, lib, pkgs, kdePackages, ...}: {
    services.desktopManager.plasma6.enable = true;
    environment.systemPackages = with pkgs; [
        pkgs.kdePackages.plasma-browser-integration
        pkgs.kdePackages.discover
        pkgs.kdePackages.partitionmanager
        pkgs.kdePackages.plasma-pa
	pkgs.kdePackages.krdc
    ];
}
