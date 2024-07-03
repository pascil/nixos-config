{config, lib, pkgs, kdePackages, ...}: {

    services.xserver = {
        enable = true;
        xkb.layout = "de";
        xkb.variant = "nodeadkeys";
    };

    xdg.portal = {
      enable = true;
      config.common.default = [ "hyprland" ];
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    };
    
    #sound.enable = true;
    #security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      wireplumber.enable = true;
      #alsa.enable = true;
      #alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    services.displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = true;
    };

    programs.dconf.enable = true;

    environment.sessionVariables = {
      QT_SCALE_FACTOR = 1;
      ELM_SCALE = 1;
      GDK_SCALE = 1;
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };

    hardware.opengl.enable = true;

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    environment.systemPackages = with pkgs; [
        (pkgs.waybar.overrideAttrs (oldAttrs: {
            mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        }))
	      pkgs.kdePackages.kwallet
        pkgs.kdePackages.dolphin
        pkgs.kitty
        pkgs.alacritty
        pkgs.libnotify
        pkgs.mako
        pkgs.wl-clipboard
        pkgs.rofi-wayland
        pkgs.hyprpaper
        pkgs.networkmanagerapplet
        pkgs.networkmanager-openvpn
        pkgs.networkmanager-vpnc
        pkgs.kdePackages.networkmanager-qt
        pkgs.flameshot
    ];

    i18n.defaultLocale = "de_DE.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
    };    

    environment.sessionVariables = {
        XCURSOR_SIZE = 24;
        TERM = "konsole";
    };
}
