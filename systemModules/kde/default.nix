{config, lib, pkgs, kdePackages, ...}: {
    options = {
        modules.system.desktop.kde.enable = lib.mkEnableOption "Enable KDE configuation";
    };

     config = lib.mkIf config.modules.system.desktop.kde.enable {
        services.desktopManager.plasma6.enable = true;
        environment.systemPackages = with pkgs; [
            pkgs.kdePackages.plasma-browser-integration
            pkgs.kdePackages.discover
            pkgs.kdePackages.partitionmanager
            pkgs.kdePackages.plasma-pa
            pkgs.libsForQt5.polonium
        ];
     };

}
