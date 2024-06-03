{ config, pkgs, kdePackages, ... }:

{

services.xserver.enable = true;
services.displayManager.sddm.enable = true;
services.displayManager.sddm.wayland.enable = true;
services.desktopManager.plasma6.enable = true;

environment.sessionVariables = {
  WLR_NO_HARDWARE_CURSORS = "1";
  NIXOS_OZONE_WL = "1";
};

hardware = {
  opengl.enable = true;
};

environment.systemPackages = with pkgs; [
  pkgs.kdePackages.plasma-browser-integration
  pkgs.kdePackages.discover
];

xdg.portal.enable = true;
xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-kde ];

sound.enable = true;
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  jack.enable = true;
};

}
