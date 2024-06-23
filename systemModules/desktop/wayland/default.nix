{
  config,
  lib,
  pkgs,
  ...
}: {
    # Allows for screen sharing to work
    xdg.portal = {
      enable = true;
      config = {
        common = {
          default = [
            "kde"
          ];
        };
      };
      extraPortals = [pkgs.xdg-desktop-portal-kde];
    };

    services.pipewire = {
      enable = true;
      # For screen sharing
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    services.displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = true;
    };

    # This is a requirement for various gtk related services
    programs.dconf.enable = true;

    environment.sessionVariables = {
      QT_SCALE_FACTOR = 1;
      ELM_SCALE = 1;
      GDK_SCALE = 1;
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
}